# DR_RTL Comparison Framework

**Active track: AST only** (`ast/`). Baseline DR_RTL is read-only reference under `../DR_RTL`.

Both tracks use the **same orchestrator pattern** from `DR_RTL/CLAUDE.md`: sub-agent delegation, no simplified batch scripts.

## LLM

| Repo | MiMo endpoint | Env vars |
|------|---------------|----------|
| `DR_RTL` | Singapore | `MIMO_API_KEY_CN`, `MIMO_URL_CN` |
| `DR_RTL_compare` | China | `MIMO_API_KEY_CN`, `MIMO_URL_CN` |

Model: **`mimo-v2.5-pro`**. Source `.cursor/mimo.env.sh` in each repo.

## Layout

```
DR_RTL_compare/
├── ast/                      # AST track (orchestrator + syn_flow + ast_ir + agents)
│   └── CLAUDE.md
├── suite/
│   ├── suite_designs.json
│   └── ORCHESTRATOR.md
├── shared/                   # design_set, scoring, eda_env
├── scripts/                  # Post-run aggregation only
└── baseline/                 # Reference docs (DR_RTL is the live baseline)
```

## Quick start

**AST track** (Cursor workspace = `ast/`):

```
Run compare6 AST per ast/CLAUDE.md
```

**Baseline track** (separate Cursor window, workspace = `DR_RTL/`):

```
Run compare6 baseline per DR_RTL/CLAUDE.md
```

## Tracks

| Track | Workspace | Analyzer | Optimizer |
|-------|-----------|----------|-----------|
| baseline | `DR_RTL/` | `@agent-rtl-timing-analyzer` | `@agent-rtl-optimizer` |
| ast | `DR_RTL_compare/ast/` | `@agent-rtl-ast-analyzer` | `@agent-rtl-ast-optimizer` |

Shared: `DR_RTL/syn_flow_eda`, `DR_RTL/rtl_dataset`, scoring in `shared/scoring.json`.

See [EXPERIMENT.md](EXPERIMENT.md) and [ast/CLAUDE.md](ast/CLAUDE.md).
