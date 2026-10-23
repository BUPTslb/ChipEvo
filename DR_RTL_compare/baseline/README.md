# Baseline Track

Uses **unmodified** [DR_RTL](../DR_RTL). Orchestration follows [DR_RTL/CLAUDE.md](../DR_RTL/CLAUDE.md).

## What runs where

| Step | Location |
|------|----------|
| Orchestrator | Cursor session on `DR_RTL/` |
| Agents | `DR_RTL/.claude/agents/` |
| RTL / iter / history | `DR_RTL/syn_flow/` |
| Evaluate | `DR_RTL/syn_flow/run_evaluate.py` |
| DC + SEC | `DR_RTL/syn_flow_eda/run_design.py` |

## Run baseline optimization

Open `DR_RTL/` in Cursor, source MiMo SGP env, then:

```
Optimize cpu_fsm per CLAUDE.md
```

Six-design suite: [DR_RTL/suite/ORCHESTRATOR.md](../DR_RTL/suite/ORCHESTRATOR.md)

Do **not** add AST changes under `DR_RTL/`.
