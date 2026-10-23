# DR_RTL_compare — AST Track

## LLM: Xiaomi MiMo-V2.5-Pro (CN endpoint)

| Setting | Value |
|---------|--------|
| Model | `mimo-v2.5-pro` |
| API key | `$MIMO_API_KEY_CN` |
| Base URL | `$MIMO_URL_CN` |

```bash
source DR_RTL_compare/.cursor/mimo.env.sh
export SLANG_BIN=~/tools/slang/slang   # after install_slang.sh
```

Open **`DR_RTL_compare/ast/`** in Cursor for AST orchestration.

## Orchestrator

Follow [`ast/CLAUDE.md`](ast/CLAUDE.md) (inherits [`DR_RTL/CLAUDE.md`](../DR_RTL/CLAUDE.md)).

Sub-agents:

| Agent | Model |
|-------|--------|
| rtl-ast-analyzer | mimo-v2.5-pro |
| rtl-ast-optimizer | mimo-v2.5-pro |
| rtl-ast-evaluator | mimo-v2.5-pro |

Granularity skill: `ast/.claude/skill/rtl-subtree-granularity/skill.md`

## EDA (shared, unchanged)

```bash
cd DR_RTL_compare/ast/syn_flow
python3 run_evaluate.py cpu_fsm v0.1
```

Uses `DR_RTL/syn_flow_eda/` — do not modify `DR_RTL/` during AST runs.

## Six-design suite

[`suite/ORCHESTRATOR.md`](suite/ORCHESTRATOR.md)

See [EXPERIMENT.md](EXPERIMENT.md) for comparison protocol.
