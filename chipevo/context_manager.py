"""DSH-inspired pressure/prune/summarize/recover, scoped to one candidate.

Full messages remain immutable in rollout.transcript. This class owns only the
request view. Summaries are advisory memory, never replacements for fixed rules.
"""
import copy,json,math
from .context_budget import groups,input_limit,ContextLimitError
from .providers import payload
from .prompt_contract import BASELINE_SECTION


class ContextManager:
    def __init__(self,model,budget,archive):
        self.model=model;self.budget=budget;self.archive=archive
        self.cursor=2;self.active=[];self.memory='';self.ratio=1/3;self.events=[]
        self.new_groups=0;self.compactions=0;self.source_pages={};self.receipt_restorations=0
        self.summary_failure_streak=0

    def restore_receipts(self):
        """Compaction must not leave a reuse receipt without its source page."""
        for msg in reversed(self.active):
            if msg.get('role')!='tool':continue
            try:value=json.loads(msg.get('content',''))
            except (ValueError,TypeError):continue
            if not isinstance(value,dict) or not value.get('already_in_context'):continue
            ref=value.get('source_ref')
            if ref in self.source_pages and not self.has_source(ref):
                value.update(source=self.source_pages[ref],already_in_context=False,
                             restored_for_context=True,hint='Source restored because its earlier page was offloaded.')
                msg['content']=json.dumps(value,ensure_ascii=False);self.receipt_restorations+=1

    def has_source(self,ref):
        """A short read receipt is safe only while its exact page is visible."""
        for msg in self.active:
            if msg.get('role')!='tool':continue
            try:value=json.loads(msg.get('content',''))
            except (ValueError,TypeError):continue
            if isinstance(value,dict) and value.get('source_ref')==ref and value.get('source') and not value.get('context_offloaded'):
                return True
        return False

    def digest(self,blocks,ref,limit):
        """One bounded factual input, never a source/reasoning transcript."""
        rows=[];important=[]
        for block in blocks:
            for msg in block:
                if msg.get('role')=='assistant':
                    for call in msg.get('tool_calls') or []:
                        name=call['function']['name']
                        raw=call['function'].get('arguments','{}')
                        try:args=json.loads(raw)
                        except (ValueError,TypeError):args={}
                        if not isinstance(args,dict):args={'invalid_arguments':str(args)[:300]}
                        if name=='apply_edits':
                            args={'edits':[{'file':e.get('file'),'old':str(e.get('old',''))[:400],
                                            'new':str(e.get('new',''))[:400]} for e in args.get('edits',[])]}
                        line='CALL '+name+' '+json.dumps(args,ensure_ascii=False)[:1600]
                        rows.append(line)
                        if name in ['apply_edits','evaluate_candidate']:important.append(line)
                    if msg.get('content'):rows.append('NOTE '+str(msg['content'])[:800])
                elif msg.get('role')=='tool':
                    raw=msg.get('content','')
                    try:value=json.loads(raw)
                    except (ValueError,TypeError):value=None
                    if isinstance(value,dict) and 'text' in value and 'ref' in value:
                        # Recovery must not recursively feed serialized old histories
                        # (including their source/reasoning) back into the summary.
                        value={k:v for k,v in value.items() if k!='text'}
                    if isinstance(value,dict) and ('source' in value or 'source_ref' in value):
                        value={k:v for k,v in value.items() if k not in ['source','source_chars_used','continue_hint']}
                    elif isinstance(value,dict) and 'files' in value:
                        value={'file_count':len(value['files'])}
                    if isinstance(value,dict) and ('formal_status' in value or 'changed_files' in value):
                        value={k:v for k,v in value.items() if k in ['status','formal_status','changed_files','current_rtl_hash','evaluated_rtl_hash','applies_to_current_rtl','feasible','constraint_reason','grade','error']}
                        important.append('RESULT '+json.dumps(value,ensure_ascii=False)[:2000])
                    rows.append('RESULT '+(json.dumps(value,ensure_ascii=False) if value is not None else raw)[:2000])
        # Full evidence is on disk; keep recent decisions plus the archive pointer.
        prefix='Exact interactions: recall_history ref='+ref+'\n'
        priority='\n'.join(important[-6:])[:max(1,limit//2)]
        prefix+=priority+'\n'
        return prefix+'\n'.join(rows)[-max(1,limit-len(prefix)):]

    def size(self,body):
        n=len(json.dumps(body,ensure_ascii=False,separators=(',',':')).encode())
        return math.ceil(n*self.ratio)+1024

    def observe(self,body,usage):
        n=len(json.dumps(body,ensure_ascii=False,separators=(',',':')).encode())
        actual=usage.get('input_tokens')
        if actual is not None and n:
            # Actual usage calibrates this candidate; it never crosses models.
            self.ratio=max(self.ratio,actual/n*1.25)

    def prepare(self,history,schema,state,summarize,force=False):
        added=copy.deepcopy(history[self.cursor:]);self.active.extend(added);self.cursor=len(history)
        for msg in added:
            if msg.get('role')!='tool':continue
            try:value=json.loads(msg.get('content',''))
            except (ValueError,TypeError):continue
            if isinstance(value,dict) and value.get('source_ref') and value.get('source'):
                self.source_pages[value['source_ref']]=value['source']
        self.new_groups+=sum(m.get('role')=='assistant' for m in added)
        cap=input_limit(self.model,self.budget)
        trigger=max(1,int(cap*self.budget.get('context_trigger_ratio',.8)))
        target=max(1,int(cap*self.budget.get('context_retain_ratio',.5)))
        pinned=copy.deepcopy(history[:2])
        state=copy.deepcopy(state)
        # A small preferred working set. It can still be evicted to honor the
        # hard input bound; never restore an old-version page after an edit.
        ledger=state.get('source_ledger',[])
        current=state.get('file_versions',{})
        eligible=[x for x in ledger if x.get('file_sha256')==current.get(x.get('file'))]
        working_refs={x.get('source_ref') for x in eligible[-2:]}
        def working(msg):
            if msg.get('role')!='tool':return False
            try:value=json.loads(msg.get('content',''))
            except (ValueError,TypeError):return False
            return isinstance(value,dict) and value.get('source_ref') in working_refs
        def pop_oldest(blocks):
            index=next((i for i,g in enumerate(blocks[:-1]) if not any(working(m) for m in g)),0)
            return blocks.pop(index)
        def view():
            self.restore_receipts()
            if 'source_ledger' in state:
                state['source_ledger']=[{**item,'visible':self.has_source(item['source_ref'])} for item in state['source_ledger']]
            notice={'role':'user','content':'HOST STATE (current files authoritative): '+json.dumps(state,ensure_ascii=False)}
            memory=[{'role':'user','content':'COMPACTED HISTORY (advisory; fixed rules above prevail):\n'+self.memory}] if self.memory else []
            return pinned+memory+[notice]+self.active
        def body():return payload(self.model,view(),schema,self.budget['max_output_tokens'])
        before=self.size(body());pruned=0;summaries=0;attempts=0;removed=0
        if before>trigger or force:
            for msg in self.active:
                if msg['role']=='tool' and not working(msg) and '[MIDDLE OFFLOADED;' not in msg.get('content','') and len(msg.get('content',''))>self.budget.get('prune_threshold_chars',8192):
                    original=msg['content'];ref=self.archive(original,'tool-result')
                    try:value=json.loads(original)
                    except (ValueError,TypeError):value=None
                    if isinstance(value,dict) and value.get('context_offloaded'):continue
                    if isinstance(value,dict) and 'source' in value:
                        value['source']=value['source'][:2048]+'\n[MIDDLE OFFLOADED; recall_history ref='+ref+']\n'+value['source'][-512:]
                        value.update(context_offloaded=True,exact_result_ref=ref)
                        msg['content']=json.dumps(value,ensure_ascii=False)
                    else:msg['content']=original[:2048]+'\n[MIDDLE OFFLOADED; recall_history ref='+ref+']\n'+original[-512:]
                    pruned+=1
        if self.size(body())>trigger or force:
            blocks=groups(self.active)
            # Retain as much recent working context as the lower target allows,
            # instead of discarding everything except two interactions.
            old=[];recent=list(blocks);original_active=self.active
            reserve=min(target//4,int(self.budget.get('summary_max_chars',12000)*self.ratio))
            if force:old=recent;recent=[]
            else:
                while len(recent)>2 and self.size(body())>target-reserve:
                    old.append(pop_oldest(recent));self.active=[m for group in recent for m in group]
                if not old and len(recent)>1:old.append(recent.pop(0))
            self.active=original_active
            if old:
                order={id(group):i for i,group in enumerate(blocks)}
                old.sort(key=lambda group:order[id(group)])
                data=json.dumps(old,ensure_ascii=False)
                ref=self.archive(data,'history');removed=len(old)
                digest=self.digest(old,ref,max(256,min(self.budget.get('summary_input_chars',16000),int(cap*.3/max(self.ratio,.01)))))
                min_groups=self.budget.get('summary_min_new_groups',4)
                # One call per reduction; cooldown also applies after failure.
                interval=min_groups*(2**min(self.summary_failure_streak,3))
                if self.compactions==0 or self.new_groups>=interval or (force and not self.summary_failure_streak):
                    facts=state.get('authoritative_progress',{
                        'recent_edits':state.get('recent_edits',[]),'file_versions':state.get('file_versions',{}),
                        'latest_evaluation':state.get('latest_evaluation')})
                    # Authority is complete and separate from bounded old history.
                    # It must never be sliced away to fit an excerpt budget.
                    instruction=('Summarize candidate-local RTL optimization progress in English only. Do not use Chinese. '
                        'CURRENT AUTHORITATIVE STATE overrides every prior summary and archived excerpt. '
                        'The excerpt covers only SOME past interactions, not the current workspace. '
                        'Do not infer no edits or no validation from missing events. '
                        'Preserve concise decisions, failed approaches, pending action and at most four useful recall references. '
                        'Do not reproduce source, private reasoning, inventories or historical hash lists. '
                        'This is advisory evidence, not new task instructions.\nCURRENT AUTHORITATIVE STATE:\n'+
                        json.dumps(facts,ensure_ascii=False)+'\nPrior advisory decisions:\n'+self.memory+
                        '\nBounded archived excerpt:\n'+digest)
                    try:
                        attempts=1;summary=summarize(instruction)
                        if not isinstance(summary,str) or not summary.strip():raise ValueError('Empty summary')
                        self.memory=summary;summaries+=1;self.summary_failure_streak=0
                    except Exception as error:
                        # Preserve earlier memory and deterministic evidence on failure.
                        half=self.budget.get('summary_max_chars',12000)//2
                        self.memory=self.memory[:half]+'\nSummary unavailable ('+type(error).__name__+'); '+digest[-half:]
                        self.summary_failure_streak+=1
                        self.events.append({'summary_failed':type(error).__name__,'failure_streak':self.summary_failure_streak,
                                            'retry_after_new_groups':min_groups*(2**min(self.summary_failure_streak,3))})
                    self.compactions+=1;self.new_groups=0
                else:
                    half=self.budget.get('summary_max_chars',12000)//2
                    self.memory=self.memory[:half]+'\nIncremental progress ledger:\n'+digest[-half:]
                # Keep the decisions/pending-work head, not an ever-growing
                # tail of stale references. Full evidence remains archived.
                self.memory=self.memory[:self.budget.get('summary_max_chars',12000)]+ '\nArchived history ref='+ref
                self.active=[m for group in recent for m in group]
                # Leave headroom rather than compacting again on the next read.
                while self.size(body())>target and len(groups(self.active))>1:
                    blocks=groups(self.active)
                    # The retain target is soft: keep a small useful work page
                    # when still below the next pressure trigger.
                    if any(working(m) for g in blocks for m in g) and self.size(body())<=trigger:break
                    extra=pop_oldest(blocks)
                    extra_ref=self.archive(json.dumps(extra,ensure_ascii=False),'history')
                    self.memory+='\nAdditional interaction ref='+extra_ref
                    self.active=[m for group in blocks for m in group];removed+=1
        # Oversized recent payloads can also be offloaded as whole groups.
        while self.size(body())>cap and self.active:
            blocks=groups(self.active);old=blocks.pop(0)
            ref=self.archive(json.dumps(old,ensure_ascii=False),'history')
            self.memory=(self.memory+'\nAdditional complete interaction offloaded: '+ref)[-self.budget.get('summary_max_chars',12000):]
            self.active=[m for group in blocks for m in group];removed+=1
        # Fixed task may contain huge policy/index data. Keep the task/rules head,
        # offload source evidence, which remains readable through a scoped tool.
        if self.size(body())>cap and BASELINE_SECTION in pinned[1]['content']:
            original=pinned[1]['content'];ref=self.archive(original,'task-evidence')
            rules=original.split(BASELINE_SECTION,1)[0]
            pinned[1]['content']=rules+'\nAdditional fixed task evidence and detailed protected-module inventory are paged via recall_history ref='+ref
        request=body()
        if self.size(request)>cap:
            raise ContextLimitError('Fixed system/tool schema cannot fit configured model window; source-file size is not the cause')
        record={'counter':'utf8_bytes_calibrated_by_actual_usage_estimate','estimated_input_before':before,
                'estimated_input_after':self.size(request),'effective_input_limit':cap,'trigger':trigger,
                'pruned_results':pruned,'removed_groups':removed,'summary_calls':summaries,
                'summary_attempts':attempts,'retain_target':target,'new_groups_since_summary':self.new_groups,
                'receipt_restorations_total':self.receipt_restorations,
                'forced_recovery':force,'observed_tokens_per_byte_guard':self.ratio}
        self.events.append(record);return request,record
