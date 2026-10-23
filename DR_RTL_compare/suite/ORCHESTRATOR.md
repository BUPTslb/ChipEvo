# Compare6 Suite — AST Track Orchestrator

AST subtree-driven track. Follow **`ast/CLAUDE.md`** (which inherits **`DR_RTL/CLAUDE.md`**).

## Prerequisites

```bash
cd DR_RTL_compare
source .cursor/mimo.env.sh   # MiMo CN: MIMO_API_KEY_CN / MIMO_URL_CN
```

Cursor: Open **`DR_RTL_compare/ast/`** as workspace root (or open `DR_RTL_compare/` and work under `ast/`). Model **`mimo-v2.5-pro`**.

## Stop a Running Session

```bash
tmux kill-session -t drrtl_ast 2>/dev/null || true
ps aux | grep suite_orchestrator | grep -v grep
```

Stop the Cursor agent chat to halt the suite. Or:

```bash
tmux kill-session -t drrtl_ast 2>/dev/null || true
ps aux | grep 'ast/orchestrator' | grep -v grep
```

## Start AST Suite (tmux) — recommended

```bash
cd DR_RTL_compare
source .cursor/mimo.env.sh   # sets SLANG_BIN + GRANULARITY_SKILL
./start_tmux.sh
tmux attach -t drrtl_ast
```

Manual run:

```bash
cd DR_RTL_compare
bash suite/run_compare6.sh
```

**Granularity skill is mandatory**: loaded from  
`ast/.claude/skill/rtl-subtree-granularity/skill.md`  
into every OPTIMIZE call via `ast/orchestrator.py`.

## Start AST Suite (Cursor)

In Cursor (AST workspace), tell the orchestrator:

```
Run compare6 AST per ast/CLAUDE.md and suite/suite_designs.json.
Designs sequential: cpu_fsm, tv80, DSP, LSTM, arm_cpu1, FIFO.
10 majors × 5 minors. Use @agent-rtl-ast-analyzer, @agent-rtl-ast-optimizer, @agent-rtl-ast-evaluator.
Do not modify DR_RTL/.
```

## Config

[suite_designs.json](suite_designs.json) — identical design list and budget as baseline.

## Parallel Baseline Track

Run simultaneously in a **second Cursor window** on **`DR_RTL/`** — see `DR_RTL/suite/ORCHESTRATOR.md`.

## Artifacts

| Path | Content |
|------|---------|
| `ast/syn_flow/log/` | iter.json (includes `critical_subtrees`) |
| `ast/syn_flow/history/` | history.json (`track: ast_subtree`) |
| `ast/artifacts/subtrees/` | pipeline ranked subtrees |
| `ast/artifacts/rewrites/` | pattern application log |
| `ast/syn_flow/output/` | PPA, timing, SEC |

## Post-Run Aggregation (optional)

After both tracks complete a suite:

```bash
cd DR_RTL_compare
python3 scripts/aggregate_results.py --suite compare6
python3 scripts/generate_report.py --suite compare6
```

These scripts only read artifacts; they do not drive optimization.
