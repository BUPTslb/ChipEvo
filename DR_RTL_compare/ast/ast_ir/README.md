# AST IR Pipeline

Transforms RTL + DC timing into ranked optimization targets.

## Parser: slang

Install (once per machine):

```bash
bash ast/ast_ir/install_slang.sh
export SLANG_BIN=~/tools/slang/slang
```

Verify:

```bash
$SLANG_BIN --version
python3 ast/ast_ir/parse_rtl.py --rtl syn_flow/rtl/cpu_fsm.v0.v --out /tmp/cpu_fsm.ast.json
```

`parse_rtl.py` runs slang `--ast-json --ast-json-source-info` and builds a symbol/block index for annotate + rank.

## Stages

```
RTL (.v/.sv)
  → parse_rtl.py      # Verilog → AST JSON
  → annotate_timing.py # Map timing_word.json endpoints → AST nodes
  → rank_subtrees.py   # Aggregate node scores → top-k subtrees
  → patterns/*.yaml    # Declarative rewrite templates (optimizer consumes)
```

## CLI

```bash
python3 pipeline.py \
  --rtl path/to/design.v \
  --timing path/to/timing_word.json \
  --design cpu_fsm --version v0.1 \
  --top-k 10 \
  --out artifacts/subtrees/cpu_fsm.v0.1.json
```

## Subtree schema

See [subtree_schema.json](subtree_schema.json).

## Parser choice

| Option | Status |
|--------|--------|
| **slang** | **Active** — release binary in `~/tools/slang/slang` |
| Pyverilog | Not used |
| Verible | Optional future comparison |
| Surelog/UHDM | Optional future scale-up |

## Output contract for agents

`rtl-ast-analyzer` reads `artifacts/subtrees/<design>.<version>.json`.

`rtl-ast-optimizer` writes:
- `syn_flow/rtl/<design>.<version>.v`
- `artifacts/rewrites/<design>.<version>.json`
