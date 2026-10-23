# AST Track (DR_RTL + AST)

Extension of DR_RTL with **RTL → AST → timing-annotated top-k subtrees → bounded rewrite**.

Orchestrator spec: [`CLAUDE.md`](CLAUDE.md) (inherits [`DR_RTL/CLAUDE.md`](../../DR_RTL/CLAUDE.md)).

Shares EDA with baseline: `syn_flow_eda` → `DR_RTL/syn_flow_eda`.

## Directory map

```
ast/
├── CLAUDE.md              # AST orchestrator (authoritative)
├── .claude/agents/        # rtl-ast-analyzer, rtl-ast-optimizer, rtl-ast-evaluator
├── syn_flow/              # RTL, log, history, output
├── ast_ir/                # pipeline.py, rank_subtrees, patterns/
└── artifacts/             # ast/, subtrees/, rewrites/
```

## Analyze → Optimize difference

| Step | Baseline | AST track |
|------|----------|-----------|
| Analyze | `@agent-rtl-timing-analyzer` | `@agent-rtl-ast-analyzer` + `pipeline.py` |
| Optimize | `@agent-rtl-optimizer` | `@agent-rtl-ast-optimizer` |
| Evaluate | `@agent-rtl-synthesis-evaluator` | `@agent-rtl-ast-evaluator` |

## Single evaluate (evaluator agent only)

```bash
cd syn_flow
python3 run_evaluate.py cpu_fsm v0.1
```

## Full optimization loop

In Cursor (workspace = `ast/`):

```
Optimize cpu_fsm AST per CLAUDE.md
```

Six-design suite: [`../suite/ORCHESTRATOR.md`](../suite/ORCHESTRATOR.md)
