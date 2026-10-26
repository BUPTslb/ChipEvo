"""Read-only script inventory and syntax audit. Never imports experiment helpers."""
import ast,json,pathlib,subprocess,gzip

def main():
    root=pathlib.Path(__file__).resolve().parents[1]
    rows=[];errors=[];excluded_vendor=0
    for folder in ['chipevo','grading','tools','tests']:
        for p in sorted((root/folder).rglob('*.py')):
            if folder=='tools' and any(x in p.relative_to(root/'tools').parts for x in ['runtime','legacy']):
                excluded_vendor+=1;continue
            rel=str(p.relative_to(root))
            try:
                tree=ast.parse(p.read_text(encoding='utf-8-sig'),filename=rel)
                imports=sorted({n.module for n in ast.walk(tree) if isinstance(n,ast.ImportFrom) and n.module})
                rows.append({'file':rel,'lines':len(p.read_text().splitlines()),'imports_from':imports,'syntax':'PASS',
                             'role':'historical_or_manual_maintenance' if folder=='tools' else folder})
            except Exception as exc:errors.append({'file':rel,'error':str(exc)})
    shell=[]
    for p in sorted((root/'tools').rglob('*.sh')):
        if 'runtime' in p.parts or 'legacy' in p.parts:continue
        r=subprocess.run(['bash','-n',str(p)],capture_output=True,text=True)
        shell.append({'file':str(p.relative_to(root)),'syntax':'PASS' if not r.returncode else 'FAIL','error':r.stderr})
    configs=[]
    for p in sorted((root/'configs').rglob('*.json')):
        try:json.loads(p.read_text());configs.append(str(p.relative_to(root)))
        except Exception as exc:errors.append({'file':str(p.relative_to(root)),'error':str(exc)})
    result={'python_scripts':rows,'shell_scripts':shell,'json_configs_parsed':configs,'errors':errors,'excluded_vendor_python_files':excluded_vendor,'model_calls':0,'eda_jobs':0,
            'note':'Syntax/inventory is not behavioral qualification of historical standalone tools.'}
    out=root/'reports/flow-audit-inventory.json';out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'python_scripts':len(rows),'shell_scripts':len(shell),'json_configs':len(configs),'errors':errors}))
    # Read a retained baseline report to inspect existing constraint diagnostics.
    for p in (root/'artifacts').rglob('sta.log.gz'):
        try:
            text=gzip.open(p,'rt').read()
            selected=[s for s in text.splitlines() if any(k in s.lower() for k in ['unconstrained','no clock','no input delay','warning:'])]
            print(json.dumps({'existing_sta_log':str(p.relative_to(root)),'constraint_diagnostics':selected[:30]}));break
        except OSError:continue
    return int(bool(errors) or any(r['syntax']!='PASS' for r in shell))

if __name__=='__main__':raise SystemExit(main())
