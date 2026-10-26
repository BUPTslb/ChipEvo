"""Read-only target retrieval from an explicitly produced baseline build."""
from pathlib import Path
import re,collections
from .util import load
from .policy import module_segments

def read_timing(build):
    """Read existing JSON, or existing human-readable STA output at its printed precision."""
    build=Path(build)
    for p in [build/'timing.json',build/'profile/timing.json']:
        if p.exists():return load(p),'existing OpenSTA JSON'
    text=(build/'sta.log').read_text();checks=[]
    for block in re.split(r'(?=^Startpoint:)',text,flags=re.M):
        if not re.search(r'^Path Type: max\s*$',block,re.M):continue
        group=re.search(r'^Path Group:\s*(\S+)',block,re.M)
        slack=re.search(r'^\s*([-\d.]+)\s+slack\s*\(',block,re.M)
        if not group or not slack:continue
        clocks=re.findall(r'\(.*?clocked by ([^\s)]+)\)',block)
        points=[]
        for line in block.splitlines():
            if 'data arrival time' in line:break
            m=re.search(r'([-\d.]+)\s+[\^v]\s+(\S+)/[^\s/]+\s+\([^)]*\)\s*$',line)
            if m:points.append({'arrival':float(m[1])*1e-9,'instance':m[2]})
        checks.append({'path_group':group[1],'target_clock':clocks[-1] if clocks else group[1],
                       'source_clock':clocks[0] if clocks else None,
                       'slack':float(slack[1])*1e-9,'source_path':points})
    if not checks:raise ValueError('No usable existing setup path evidence; explicitly evaluate a baseline first')
    return {'checks':checks},'existing OpenSTA text; limited to printed precision and reported paths'

def annotate(d,index,policy):
    result=[]
    for original in index:
        row=dict(original);rel=row.get('file','').removeprefix('rtl/')
        row['protected']=rel not in policy['editable_files']
        row['fixed_storage']=False
        p=d/'reference'/rel
        if p.is_file():
            text=p.read_text()
            for name,body in module_segments(text).items():
                start=text[:text.find(body)].count('\n')+1;end=start+body.count('\n')
                if row.get('module')==name or start<=row.get('start_line',-1)<=end:
                    row['protected']|=name in policy['protected_modules'].get(rel,[])
                    row['fixed_storage']=name in policy['fixed_storage_modules'].get(rel,[])
        result.append(row)
    return result

def context(root,design,strategy='hierarchy_area',run=None):
    root=Path(root);d=root/'designs'/design;policy=load(d/'policy.json')
    if run is None:
        saved=d/'context/module-index.json'
        if not saved.exists():raise ValueError('No saved module index; first explicitly evaluate a baseline')
        if strategy!='hierarchy_area':raise ValueError('Timing/syntax strategies require --run pointing to existing evaluated results; no experiment was launched')
        index=annotate(d,load(saved),policy)
        return {'design':design,'strategy':strategy,'source':'frozen historical module index; not a new measurement','storage_fixed':True,'module_index':index,'suggested_targets':[r for r in index if not r['protected']][:5],'note':'Use --run with an explicitly evaluated baseline for refreshed timing/syntax evidence'}
    b=Path(run)/'baseline/build'
    if not b.exists():b=Path(run)/'build'
    saved=b/('localization-'+strategy+'.json')
    if saved.exists():
        result=load(saved)
        result['evidence']={**result.get('evidence',{}),'run':str(Path(run)),
            'kind':'retained_measured_localization','note':'Compact measured evidence; mapped netlist may have been pruned or baseline measurement cached.'}
        return result
    mapped=load(b/'mapped.json')['modules'];manifest=load(d/'manifest.json');top=manifest['top']
    index=[];counts=collections.Counter()
    def walk(n):
        counts[n]+=1
        for c in mapped[n]['cells'].values():
            if c['type'] in mapped and not str(mapped[c['type']].get('attributes',{}).get('blackbox','0')).strip('0'):walk(c['type'])
    walk(top)
    # Preserve historical exclusive area rankings when names correspond; clearly
    # label them instead of pretending unmeasured source-size is physical area.
    old={x['module']:x for x in load(d/'context/module-index.json')} if (d/'context/module-index.json').exists() else {}
    for name,count in counts.items():
        row=dict(old.get(name,{}));row.update(module=name,instances=count,source=mapped[name].get('attributes',{}).get('src'))
        index.append(row)
    # Build exclusive mapped area, without double-counting child-module area.
    lib=(root/'technology/NangateOpenCellLibrary_typical.lib').read_text()
    areas={n:float(v) for n,v in re.findall(r'\bcell\s*\(\s*([^\s)]+)\s*\)\s*\{.*?\barea\s*:\s*([\d.eE+-]+)',lib,re.S)}
    if manifest.get('sram_mapping'):areas.update(load(root/manifest['sram_mapping'])['macro_areas'])
    for row in index:
        name=row['module'];row['exclusive_area_all_instances_um2']=sum(areas.get(c['type'],0) for c in mapped[name]['cells'].values())*row['instances']
        source=row.get('source') or '';m=re.match(r'(.+):(\d+)\.\d+-(\d+)\.\d+',source)
        if m and '/rtl/' in m[1]:row.update(file='rtl/'+m[1].split('/rtl/',1)[1],start_line=int(m[2]),end_line=int(m[3]))
    index=annotate(d,index,policy);index.sort(key=lambda r:r['exclusive_area_all_instances_um2'],reverse=True)
    result={'design':design,'strategy':strategy,'module_index':index,'storage_fixed':True,'area_ranking_source':'current supplied mapped netlist; exclusive own cells times actual instances','suggested_targets':[r for r in index if not r['protected']][:5]}
    result['evidence']={'kind':'supplied_existing_run','run':str(Path(run)),
                        'synthesis_config':load(b/'synthesis-config.json') if (b/'synthesis-config.json').exists() else None,
                        'note':'Read existing artifacts only; no synthesis or STA was launched'}
    if strategy!='hierarchy_area':
        paths=[]
        timing,format_note=read_timing(b)
        result['timing_evidence_format']=format_note
        for p in timing.get('checks',[]):
            if p.get('path_group')!=p.get('target_clock') or not p.get('target_clock'):continue
            if p.get('source_clock') and p['source_clock']!=p['target_clock']:continue
            paths.append(p)
        paths=sorted(paths,key=lambda p:p['slack']);rank=collections.defaultdict(lambda:{'sum_path_cell_delay_ns':0.,'path_ids':set(),'source_anchors':set()})
        def locate(instance):
            mod=top;remaining=instance
            while remaining:
                matches=[n for n in mapped[mod]['cells'] if remaining==n or remaining.startswith(n+'/')]
                if not matches:return mod,None
                key=max(matches,key=len);cell=mapped[mod]['cells'][key];typ=cell['type']
                if typ not in mapped or typ in areas:return mod,cell
                mod=typ;remaining=remaining[len(key):].lstrip('/')
            return mod,None
        indexed={row['module']:row for row in index}
        selected=[];fixed_paths=[]
        for path in paths:
            contributions={};previous=None
            anchors=collections.defaultdict(set)
            for point in path.get('source_path',[]):
                arrival=float(point.get('arrival',0))
                if point.get('instance'):
                    mod,cell=locate(point['instance']);delta=max(0.,arrival-previous)*1e9 if previous is not None else 0.
                    contributions[mod]=contributions.get(mod,0.)+delta
                    if cell and cell.get('attributes',{}).get('src'):anchors[mod].add(cell['attributes']['src'])
                previous=arrival
            path['module_delay_ns']=contributions
            mutable=any(delay>0 and not indexed.get(mod,{'protected':True})['protected'] for mod,delay in contributions.items())
            if not mutable:
                if len(fixed_paths)<10:fixed_paths.append(path)
                continue
            if len(selected)>=10:continue
            number=len(selected);selected.append(path)
            for mod,delta in contributions.items():
                rank[mod]['sum_path_cell_delay_ns']+=delta;rank[mod]['path_ids'].add(number)
                rank[mod]['source_anchors'].update(anchors[mod])
        result['critical_paths']=selected
        result['fixed_only_critical_paths']=fixed_paths
        result['localization_scope']='Up to ten worst reported same-clock paths with positive contribution in editable modules; fixed-only worst paths retained separately. Scoring still evaluates all required paths.'
        targets=[]
        for mod,values in rank.items():
            row=dict(indexed.get(mod,{'module':mod,'protected':True}));row.update(sum_path_cell_delay_ns=values['sum_path_cell_delay_ns'],path_count=len(values['path_ids']),source_anchors=sorted(values['source_anchors']))
            targets.append(row)
        targets.sort(key=lambda r:r['sum_path_cell_delay_ns'],reverse=True)
        result['timing_targets']=targets
        result['suggested_targets']=[r for r in targets if not r['protected']][:5]
    if strategy=='timing_syntax':
        import pyslang
        from pyslang.syntax import SyntaxTree
        from pyslang.parsing import PreprocessorOptions
        pp=PreprocessorOptions();pp.predefines=manifest['defines'];pp.additionalIncludePaths=[str(d/('reference/'+x[4:] if x.startswith('rtl/') else x)) for x in manifest['includes']]
        bag=pyslang.Bag([pp])
        spans=[]
        target_files={r.get('file','').removeprefix('rtl/') for r in result['suggested_targets'][:3]}
        for rel in policy['editable_files']:
            if rel not in target_files:continue
            sm=pyslang.SourceManager();tree=SyntaxTree.fromFile(str(d/'reference'/rel),sm,bag)
            if any(diag.isError() for diag in tree.diagnostics):raise ValueError('Syntax localization preprocessing/parsing failed: '+rel)
            def visit(node):
                kind=str(getattr(node,'kind',''))
                if hasattr(node,'sourceRange') and any(k in kind for k in ['Always','ContinuousAssign','FunctionDeclaration']):
                    r=node.sourceRange
                    spans.append({'file':rel,'kind':kind,'start_line':sm.getLineNumber(r.start),'end_line':sm.getLineNumber(r.end)})
            tree.root.visit(visit)
        result['syntax_spans']=spans
        result['syntax_note']='Exact spans in files of the top three mutable timing targets; no claim that these are proved semantic cones. Retrieve around path register anchors.'
    return result
