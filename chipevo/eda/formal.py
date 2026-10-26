"""Bottom-up compositional self/candidate equivalence of all elaborated modules.
Children are shared only after their parameter-specialized definitions are proven.
Unmapped or mismatched module/interface sets are rejected, never blackboxed away.
"""
from pathlib import Path
import json,sys,concurrent.futures,re,copy,shutil
sys.path.insert(0,str(Path(__file__).parent))
from ..util import execute,save,ys_quote

def exact_graph(mod):
 """Exact bit graph, not inferred signal matching or structural heuristics.

 Numeric bit identities, port/state names, cell parameters and every connection
 must agree. Source locations and generated cell identifiers carry no behavior.
 Explicit initialization is checked independently before this predicate is used.
 """
 cells=[]
 for original in mod['cells'].values():
  cell={k:v for k,v in original.items() if k!='attributes'}
  if cell['type']=='$mem_v2':cell={**cell,'parameters':{k:v for k,v in cell['parameters'].items() if k!='MEMID'}}
  cells.append(json.dumps(cell,sort_keys=True))
 nets={name:{k:v for k,v in net.items() if k!='attributes'} for name,net in mod.get('netnames',{}).items() if not net.get('hide_name')}
 return {'ports':mod['ports'],'cells':sorted(cells),'named_nets':nets}
def prove(name,yosys):
 Y=yosys
 d=Path(name).resolve(); b=d/'build/hierproof-v6'; b.mkdir(exist_ok=True); m=json.loads((d/'manifest.json').read_text())
 result={'status':'running','proof_recipe':'sat-v3-exact-graph-identity','method':'bottom-up all elaborated parameter-specialized modules; exact bit-graph identity or SAT; shared children require proven definitions; identical memory primitive contracts plus all input equality; explicit named initial-state contract','modules':[],'memory_contracts':[],'initial_state_contracts':[],'unconnected_inputs':[]}; save(b/'result.json',result)
 for ref,label in [(True,'gold'),(False,'gate')]:
  def path(x):return str(d/(x.replace('rtl','reference',1) if ref else x))
  includes=[]
  for j,x in enumerate(m['includes']):
   directory=path(x)
   if any(c.isspace() for c in directory):
    alias=b/f'include-{label}-{j}';shutil.copytree(directory,alias);directory=str(alias.relative_to(d))
   includes.append('-I'+directory)
  s='read_verilog -sv '+' '.join(['-D'+x for x in m['defines']]+includes+[ys_quote(path(x)) for x in m['sources']])+'\n'
  s+='hierarchy -check -top '+m['top']+''.join(' -chparam '+k+' '+str(v) for k,v in m['params'].items())+'\nproc\nopt_clean\nmemory_collect\nopt_clean\n'
  s+=f'write_rtlil {ys_quote(b/(label+".il"))}\nwrite_json {ys_quote(b/(label+".json"))}\n'
  f=b/(label+'.ys'); f.write_text(s)
  r=execute([Y,'-s',str(f)],d,b/(label+'.log'),900)
  if r['exit_code']: result.update(status='elaboration_failed',detail=r);save(b/'result.json',result);return
 g=json.loads((b/'gold.json').read_text())['modules']; c=json.loads((b/'gate.json').read_text())['modules']
 if set(g)!=set(c): result['status']='module_set_mismatch';save(b/'result.json',result);return
 order=[]; visiting=set()
 def visit(n):
  if n in order:return
  if n in visiting:raise RuntimeError('recursive hierarchy')
  visiting.add(n)
  for mod in [g[n],c[n]]:
   if any(mod.get('attributes',{}).get(a,'0').strip('0') for a in ['blackbox','whitebox']):raise RuntimeError('Unqualified opaque module '+n)
   for cell in mod['cells'].values():
    t=cell['type']
    if t in g:visit(t)
    elif not t.startswith('$'):raise RuntimeError('Unknown cell '+t)
  visiting.remove(n);order.append(n)
 visit(m['top'])
 for i,n in enumerate(order):
  # equiv_simple reasons about transition equivalence, not time-zero observations.
  # Preserve explicit initialized state before invoking it. Renaming initialized
  # nets is conservatively unsupported until a state correspondence is supplied.
  def initial_contract(mod):
   return {name:{'width':len(net['bits']),'offset':net.get('offset',0),'upto':net.get('upto',0),'init':net['attributes']['init']}
           for name,net in mod.get('netnames',{}).items() if 'init' in net.get('attributes',{})}
  gi=initial_contract(g[n]);ci=initial_contract(c[n])
  if gi!=ci:
   result.update(status='initial_state_mismatch',module=n,initial_state_difference={'gold':gi,'gate':ci});save(b/'result.json',result);return
  if gi:result['initial_state_contracts'].append({'module':n,'initialized_nets':sorted(gi),'contract':'identical explicit initial values and named state correspondence'})
  if {p:(v['direction'],len(v['bits'])) for p,v in g[n]['ports'].items()}!={p:(v['direction'],len(v['bits'])) for p,v in c[n]['ports'].items()}:
   result.update(status='interface_mismatch',module=n);save(b/'result.json',result);return
  # Selecting equiv only avoids expanding child hierarchy. Shared functional child
  # cells are congruent because every reachable specialized child passed earlier.
  ident='\\'+n
  children_g={k:v for k,v in g[n]['cells'].items() if v['type'] in g}
  children_c={k:v for k,v in c[n]['cells'].items() if v['type'] in c}
  memories_g={k:v for k,v in g[n]['cells'].items() if v['type']=='$mem_v2'}
  memories_c={k:v for k,v in c[n]['cells'].items() if v['type']=='$mem_v2'}
  # Yosys-generated ROM IDs depend on global pass counters, not RTL identity.
  # Match remaining primitives by a unique complete behavioral signature.
  # The subsequent cut still proves EVERY input; no behavior is assumed from
  # a name/signature alone. Ambiguous pairing is conservatively rejected.
  def signature(mem):return json.dumps({k:v for k,v in mem['parameters'].items() if k!='MEMID'},sort_keys=True)
  if set(memories_g)!=set(memories_c):
   remaining=set(memories_c);pairs={}
   for inst,mem in memories_g.items():
    matches=[key for key in remaining if signature(mem)==signature(memories_c[key])]
    if inst in matches:other=inst
    elif len(matches)==1:other=matches[0]
    else:raise RuntimeError('Missing or ambiguous memory semantic correspondence')
    pairs[inst]=other;remaining.remove(other)
   if remaining:raise RuntimeError('Extra candidate memory primitive')
   renamed={inst:memories_c[key] for inst,key in pairs.items()}
   for key in memories_c:del c[n]['cells'][key]
   c[n]['cells'].update(renamed);memories_c=renamed
   result.setdefault('memory_name_correspondence',[]).extend({'module':n,'gold':k,'gate':v} for k,v in pairs.items() if k!=v)
  for inst,mem in memories_g.items():
   gp={k:v for k,v in mem['parameters'].items() if k!='MEMID'};cp={k:v for k,v in memories_c[inst]['parameters'].items() if k!='MEMID'}
   if gp!=cp or mem['port_directions']!=memories_c[inst]['port_directions']:raise RuntimeError('Memory semantic parameters changed')
   result['memory_contracts'].append({'module':n,'cell':inst,'primitive':'$mem_v2','all_behavioral_parameters_equal':True,'ignored_parameter':'MEMID (identifier only)','input_equivalence_obligatory':True,'initial_state_relation':'identical corresponding memory contents, including INIT constraints'})
  cuts_g=children_g|memories_g
  if set(children_g)!=set(children_c):raise RuntimeError('Child instance set changed')
  for inst,child in children_g.items():
   other=children_c[inst]
   if child['type']!=other['type'] or child['parameters']!=other['parameters'] or set(child['connections'])!=set(other['connections']):raise RuntimeError('Child configuration or connected port set changed')
  # This proves unchanged elaborated logic by identity; it never guesses any
  # correspondence or assumes a relation between different inputs. All children
  # already passed bottom-up, and memory/initial-state contracts passed above.
  if exact_graph(g[n])==exact_graph(c[n]):
   for inst,child in children_g.items():
    for pn,pv in g[child['type']]['ports'].items():
     if pv['direction']=='input' and pn not in child['connections']:
      result['unconnected_inputs'].append({'module':n,'instance':inst,'port':pn,'width':len(pv['bits']),'semantics':'original unconnected undef; identical graph; no tie-off added; X/refinement scope'})
   result['modules'].append({'module':n,'passed':True,'method':'exact_elaborated_bit_graph_identity','exit_code':0,'seconds':0})
   save(b/'result.json',result);continue
  # Congruence cut: shared arbitrary child outputs are module inputs. Every
  # child input becomes an extra proof output. Proving all of these plus the
  # real outputs, and proving every child separately, gives a composition proof.
  # No behavioral child is silently removed: its input equality is obligatory.
  for label,original in [('gold',g[n]),('gate',c[n])]:
   mod=copy.deepcopy(original)
   for j,inst in enumerate(sorted(cuts_g)):
    child=mod['cells'].pop(inst)
    ports=g[child['type']]['ports'] if inst in children_g else {pn:{'direction':di,'bits':child['connections'][pn]} for pn,di in child['port_directions'].items()}
    for k,(pn,pv) in enumerate(sorted(ports.items())):
     if pv['direction'] not in ['input','output']:raise RuntimeError('Unsupported inout child')
     if pn not in child['connections']:
      if pv['direction']=='output':continue
      # Preserve the original disconnected-input/X contract in both sides.
      # Both sides must keep the same connection set (checked above). This is
      # explicitly reported, never silently repaired by a guessed constant.
      bits=['x']*len(pv['bits'])
      if label=='gold':result['unconnected_inputs'].append({'module':n,'instance':inst,'port':pn,'width':len(bits),'semantics':'original unconnected undef; no tie-off added; X/refinement scope'})
     else:bits=child['connections'][pn]
     if not bits:continue
     direction='input' if pv['direction']=='output' else 'output'
     tag=f'CHIPEVO_CUT_{j}_{k}'
     if tag in mod['ports'] or tag in mod['netnames']:raise RuntimeError('Cut name collision')
     if direction=='input' and any(not isinstance(v,int) for v in bits):raise RuntimeError('Constant child output')
     mod['ports'][tag]={'direction':direction,'bits':bits}
     mod['netnames'][tag]={'hide_name':0,'bits':bits,'attributes':{}}
   save(b/f'module-{i:03}-{label}.json',{'modules':{label:mod}})
  # equiv_struct can invent false input correspondences for commutative
  # rewrites (e.g. a&b -> b&a). Prove the original obligations with SAT;
  # never require heuristic structural matches to become additional truths.
  s=f'read_json {ys_quote(b/f"module-{i:03}-gold.json")}\nread_json {ys_quote(b/f"module-{i:03}-gate.json")}\nselect gold gate\nmemory_map\nclk2fflogic\nopt_clean\nselect *\nequiv_make gold gate equiv\nselect equiv\nequiv_simple -seq 2\nequiv_status -assert\n'
  f=b/f'module-{i:03}.ys';f.write_text(s)
  r=execute([Y,'-s',str(f)],d,b/f'module-{i:03}.log',300)
  r.update(module=n,passed=r['exit_code']==0 and 'Equivalence successfully proven!' in (b/f'module-{i:03}.log').read_text(errors='replace'))
  result['modules'].append(r);save(b/'result.json',result)
  if not r['passed']:result.update(status='unproven',module=n);save(b/'result.json',result);return
 result.update(status='PASS',top=m['top'],count=len(order),scope='all reachable module definitions under frozen elaborated parameters; cycle-preserving composition; initial state correspondence required')
 save(b/'result.json',result)

