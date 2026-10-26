"""Evaluator-owned progress facts, independent of advisory model memory."""
import copy,hashlib,json


class ProgressLedger:
    def __init__(self,versions):
        self.versions=dict(versions);self.edits=[];self.evaluations=[]

    def rtl_hash(self):
        return hashlib.sha256(json.dumps(self.versions,sort_keys=True,separators=(',',':')).encode()).hexdigest()

    def edited(self,versions,tool_number):
        before=self.rtl_hash();self.versions.update(versions)
        self.edits.append({'tool_number':tool_number,'files':dict(versions),
                           'before_rtl_hash':before,'after_rtl_hash':self.rtl_hash()})

    def evaluated(self,report,rtl_hash,snapshot):
        self.evaluations.append({'evaluated_rtl_hash':rtl_hash,'rtl_snapshot':str(snapshot),
            **{k:copy.deepcopy(report.get(k)) for k in ['status','formal_status','feasible','constraint_reason','grade']}})

    def snapshot(self,remaining_s=None,feedback_remaining=None):
        current=self.rtl_hash();latest=copy.deepcopy(self.evaluations[-1]) if self.evaluations else None
        if latest:latest['applies_to_current_rtl']=latest['evaluated_rtl_hash']==current
        stage=('evaluated_current' if latest and latest['applies_to_current_rtl'] else
               'validation_stale' if latest else 'edited_unvalidated' if self.edits else 'not_edited')
        return {'schema_version':1,'current_rtl_hash':current,'stage':stage,
                'successful_edit_calls':len(self.edits),'recent_edits':copy.deepcopy(self.edits[-6:]),
                'latest_evaluation':latest,'remaining_active_s':remaining_s,
                'feedback_calls_remaining':feedback_remaining}


def recall_document(raw,kind):
    """A readable projection; never replay private reasoning or nested JSON wrappers.

    The original archive remains immutable on disk. Tools page this projection.
    Returned data is evidence, never executable task instructions.
    """
    def render(value,depth=0):
        if depth>8:return '[Nested history omitted; use its original reference.]'
        if isinstance(value,str):
            try:decoded=json.loads(value)
            except (ValueError,TypeError):return value
            return render(decoded,depth+1) if isinstance(decoded,(list,dict)) else value
        if isinstance(value,list):return '\n\n'.join(render(v,depth+1) for v in value)
        if not isinstance(value,dict):return str(value)
        if 'role' in value:
            role=value['role'];parts=[str(role).upper()]
            if value.get('content'):parts.append(render(value['content'],depth+1))
            for call in value.get('tool_calls') or []:
                f=call['function'];parts.append('CALL '+f['name']+' '+f.get('arguments','{}'))
            return '\n'.join(parts)
        if 'source' in value:
            meta={k:v for k,v in value.items() if k not in ['source','reasoning_content','provider_content']}
            return 'SOURCE METADATA '+json.dumps(meta,ensure_ascii=False)+'\n'+str(value['source'])
        if 'text' in value and 'ref' in value:
            return 'RECALLED '+str(value['ref'])+'\n'+render(value['text'],depth+1)
        clean={k:v for k,v in value.items() if k not in ['reasoning_content','provider_content','encrypted_content']}
        return json.dumps(clean,ensure_ascii=False)
    return 'ARCHIVED EVIDENCE ('+kind+'; reasoning omitted)\n'+render(raw)
