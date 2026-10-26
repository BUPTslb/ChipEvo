"""Explicit protected-module contracts, enforced before any native tool runs."""
from pathlib import Path
import re,difflib
from .util import load,sha,inside

def safe_tree(path):
    """Check directories too: copytree otherwise follows extra directory links."""
    path=Path(path).absolute()
    if any(p.is_symlink() for p in [path,*path.parents]):
        raise ValueError('Candidate RTL symlink is forbidden')
    if not path.is_dir():raise ValueError('Candidate RTL directory is missing')
    for p in path.rglob('*'):
        if p.is_symlink() or not (p.is_file() or p.is_dir()):
            raise ValueError('Candidate RTL links and special files are forbidden')
    return path.resolve()

def edge_events(text):
    """Conservative frozen-clock contract; ignore comments and string literals."""
    masked=re.sub(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\])*"',lambda m:' '*len(m[0]),text,flags=re.S)
    events=set()
    for m in re.finditer(r'@\s*\(',masked):
        start=m.end();end=start;depth=1
        while end<len(masked) and depth:
            if masked[end]=='(':depth+=1
            elif masked[end]==')':depth-=1
            end+=1
        if depth:raise ValueError('Unterminated RTL event control')
        event=masked[start:end-1]
        if re.search(r'\b(?:posedge|negedge)\b',event):events.add(re.sub(r'\s+','',event))
    # Also support legal unparenthesized edge controls.
    events.update(re.sub(r'\s+','',m[1]) for m in re.finditer(r'@\s*((?:posedge|negedge)\s+[\\\w$.[\]]+)',masked))
    return events

def module_segments(text):
    # Preserve character offsets while masking comments and quoted strings.
    token=re.compile(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\])*"',re.S)
    masked=token.sub(lambda m:' '*len(m.group()),text)
    declarations=list(re.finditer(r'\bmodule\s+(?:automatic\s+)?(\\[^\s]+|[A-Za-z_$][\w$]*)',masked))
    result={}
    for m in declarations:
        e=re.search(r'\bendmodule\b',masked[m.end():])
        if not e:raise ValueError("Unterminated module "+m[1])
        end=m.end()+e.end()
        name=m[1];number=2
        while name in result:name=m[1]+f'#{number}';number+=1
        result[name]=text[m.start():end]
    return result

def nonmodule_text(text):
    parts=module_segments(text)
    # Full declaration strings are unique by their positions/contents; remove in
    # source order. Anything outside declarations (defines/includes/attributes)
    # must remain identical, even in a file sharing mutable and fixed modules.
    cursor=0;out=[]
    for name,body in parts.items():
        start=text.find(body,cursor)
        out.append(text[cursor:start]);out.append('<MODULE:'+name+'>');cursor=start+len(body)
    out.append(text[cursor:]);return ''.join(out)

def validate(design,candidate):
    design=Path(design);candidate=safe_tree(candidate);policy=load(design/"policy.json")
    if not candidate.is_dir():raise ValueError("Candidate RTL directory is missing")
    expected=policy["file_sha256"]
    actual={str(p.relative_to(candidate)) for p in candidate.rglob('*') if p.is_file()}
    if actual!=set(expected):raise ValueError("Candidate file set changed (including headers); preserve the frozen RTL file set")
    changed=[];changed_lines=0
    for rel,h in expected.items():
        p=candidate/rel
        if p.is_symlink():raise ValueError("Candidate RTL symlink is forbidden")
        inside(candidate,p)
        if sha(p)==h:continue
        if rel not in policy["editable_files"]:raise ValueError("Protected RTL file changed: "+rel)
        original=(design/'reference'/rel).read_text();new=p.read_text()
        a=module_segments(original);b=module_segments(new)
        if set(a)!=set(b):raise ValueError("Module declarations changed: "+rel)
        if nonmodule_text(original)!=nonmodule_text(new):raise ValueError('Text outside module declarations changed: '+rel)
        for name in a:
            if not edge_events(b[name]).issubset(edge_events(a[name])):
                raise ValueError('Frozen clock/asynchronous-reset event changed: '+name)
        for name in policy['protected_modules'].get(rel,[]):
            if a.get(name)!=b.get(name):raise ValueError("Protected module changed: "+name)
        # Includes and external file IO are evaluator-owned; do not permit new ones.
        directive=re.compile(r'`include[^\n]*|\$(?:system|fopen|readmemh|readmemb|writememh|writememb)\s*\([^;]*',re.S)
        if directive.findall(original)!=directive.findall(new):raise ValueError("External RTL directives changed: "+rel)
        changed.append(rel)
        changed_lines+=sum(line.startswith(('+ ','- ')) for line in difflib.ndiff(original.splitlines(),new.splitlines()))
    # No implicit two-file/200-line cap in v2. Task-specific limits are optional.
    file_limit=policy.get('max_changed_files');line_limit=policy.get('max_changed_lines')
    if file_limit is not None and len(changed)>file_limit:raise ValueError('Explicit changed-file budget exceeded')
    if line_limit is not None and changed_lines>line_limit:raise ValueError('Explicit changed-line budget exceeded (removed plus added lines)')
    return {"changed_files":changed,"changed_lines":changed_lines,"fixed_storage":True,"policy_version":policy['version']}
