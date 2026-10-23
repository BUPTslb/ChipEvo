# AST track — orchestrator bugfix changelog (2026-05-24)

Fixes from log analysis of `build/suite_ast/logs/run_20260524_140816.log`.

## P0 — Critical

| ID | Fix | Files |
|----|-----|-------|
| P0-1 | After PROMOTE, run `run_evaluate` on promoted major so `output/{design}.v{N+1}/timing_word.json` exists before next major minors; stop design on failure; `best_ppa` read from evaluated promoted output | `ast/orchestrator.py`, `DR_RTL/syn_flow/orchestrator.py` |
| P0-2 | Harden `extract_verilog()` (no raw-text fallback); add `extract_verilog_with_retry()` wired into optimize steps | `shared/agent_runtime.py`, both orchestrators |
| P0-3 | Pre-evaluate slang syntax check via `validate_rtl_slang()` (`SLANG_BIN`); skip evaluate on failure | `shared/agent_runtime.py`, `ast/orchestrator.py` (+ baseline optional) |
| P0-4 | EDA mutual exclusion: `flock -w 3600 /tmp/chipevo_eda.lock` around `run_design.py` | `ast/syn_flow/run_evaluate.py`, `DR_RTL/syn_flow/run_evaluate.py` |

## P1 — Important

| ID | Fix | Files |
|----|-----|-------|
| P1-5 | Post-evaluate `pipeline.py` decoupled: warnings only, never fails evaluate RC | `ast/syn_flow/run_evaluate.py` |
| P1-6 | OPTIMIZE system prompt uses `skill-summary.md` (~45 lines); full skill path still logged | `ast/orchestrator.py`, `skill-summary.md` |
| P1-7 | RECORD: `sec=pass` + null WNS/TNS/Area → `sec=pass synth=fail`, excluded from minor candidates | both orchestrators |

## EDA lock

When baseline and AST run **in parallel**, each track uses its own `CHIP_EVO_EDA_ROOT`:

| Track | EDA workspace |
|-------|----------------|
| Baseline | `DR_RTL/syn_flow_eda` |
| AST | `DR_RTL_compare/ast/build/eda_workspace` |

Setup: `scripts/setup_ast_eda_workspace.sh` (also run by `start_tmux.sh`).

Parallel launch: `DR_RTL_compare/start_parallel_compare6.sh`

JasperGold safety in `run_design.py`: absolute TCL path, `timeout` (default 7200s), log parse for TCL open errors.

Optional: `export CHIP_EVO_SEC_TIMEOUT_SEC=3600` to shorten SEC watchdog.

## Remaining gaps

- Baseline track does not require `SLANG_BIN` for syntax pre-check (optional; fails open if unset).
- `promote_evaluate_failed` is a new `end_reason`; resume logic not yet implemented.
- Invalid LLM RTL that passes slang but fails DC/SEC still burns an EDA slot.

## full20 parallel experiment (2026-06-07)

| Field | Value |
|-------|-------|
| Suite | full20 (20 designs, 10 majors x 5 minors) |
| tmux session | `drrtl_ast` |
| Launch | `DR_RTL_compare/start_parallel_full20.sh` or `./start_tmux.sh` |
| Prior compare6 | archived to `DR_RTL_compare/archive/compare6_20260524` |
| EDA workspace | `ast/build/eda_workspace` (isolated from baseline) |
| Gate smoke | cpu_fsm v0 — SEC PASSED, PPA valid after env_chip.sh fix (2026-06-07) |
| Invalid run | archived to `DR_RTL_compare/archive/full20_invalid_dc_20260607` |
| Restarted | 2026-06-07 19:40 — valid PPA confirmed on aes.v0 |
| Meta | `DR_RTL_compare/results/full20/meta.json` |
