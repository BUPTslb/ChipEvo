# Flow audit: 2026-10-25

This release fixes evaluator and orchestration errors. It does not change the
optimization goals, frequencies, scoring formula, memory implementation or RTL.
Historical experiments and their original reports remain unchanged. They belong
to their historical evaluator release and must not be relabeled as new results.

| Finding | Consequence | Fix |
| --- | --- | --- |
| Transition equivalence accepted a changed explicit register initial value | A functionally different time-zero behavior could pass | Compare elaborated named initialization contracts before SAT; preserve memory INIT contracts. Renamed initialized state is conservatively unsupported. |
| Extra directory symlinks escaped the file-only policy inventory | Staging could follow data outside RTL | Reject root/ancestor/directory links and special files before validation/copying. Reject overlapping RTL/output paths. |
| New clock/reset edge controls were not explicitly protected | A candidate could change the clocking contract | Enforce a conservative per-module edge-event policy in addition to equivalence. |
| Refusal/empty/failed provider deliveries were incompletely classified | A failed delivery could enter final EDA | Normalize stop reasons, allow only supported complete deliveries, retain received usage and response files before rejecting. |
| Returned model identity was recorded but not enforced | A provider fallback could be mislabeled | Require the requested returned identity, or an explicit frozen `accepted_returned_models` allowlist. |
| NaN/infinite/bool timing values and null usage details were insufficiently guarded | Invalid scoring/accounting | Reject invalid metrics; require complete finite STA summaries; preserve invalid/missing token counts as unknown. |
| OpenSTA exit code 0 did not imply complete constraints | Unclocked registers or unconstrained endpoints could be scored | Require an empty dedicated `constraint-coverage.txt` report for no-clock/endpoints/loops/generated-clock checks; retain/cache that report. |
| Absolute paths containing spaces broke formal/STA, ABC script invocation and library-path parsing | Valid deployments could fail or hang | Quote Yosys files, use safe include aliases, pass a fixed relative STA script path, inline the unchanged ABC recipe instead of an absolute `source` path, preserve full paths in loader diagnostics. |
| Platform wrapper could accept a stale result or malformed schema | Wrong reported score | Remove prior result before grading and validate exactly `resolved`, `score`, `reason`, including types and finite [0,1] score. Publish failure reports as well. |
| Grading code and the runtime hash manifest were outside the main asset lock | Incomplete evaluator provenance | Lock grading scripts and runtime manifest; reject unexpected trusted asset inventory changes. Reject links/recursive outputs during packaging. |
| Syntax localization searched missing `rtl/` headers in evaluator snapshots | Missing or inaccurate syntax hints | Resolve frozen headers under `reference/`; reject parser errors. |
| Default pytest discovery could collect historical executable helpers | Unintended EDA during tests | Restrict default discovery to `tests/`. Native regressions remain explicit opt-ins. |
| Timeout process-exit race could skip status publication | Lost tool accounting | Tolerate an already-exited process while terminating its process group and still write status JSON. |

The supported experiment entry is `tools/start_rollout.sh` / `chipevo study-run`.
`study.py` owns five isolated candidates, file-based parent/selected RTL handoffs,
fixed prompts and candidate ranking. `rollout.py` owns bounded tools and context.
`engine.py` owns trusted policy, proof, synthesis/STA and scoring. `grading/` owns
the external platform contract. Standalone NVDLA preparation/characterization
helpers under `tools/` are maintenance/history, not the rollout implementation.

Run the read-only/static and mocked regression audit:

```bash
.venv/bin/python tools/audit_flow.py --check-tools
```

Explicitly include tiny synthetic native regressions (no model or real design):

```bash
.venv/bin/python tools/audit_flow.py --check-tools --native-unit-tests
```

Results: `reports/flow-audit-latest.json`, `reports/flow-audit-tests.log`, and
`reports/flow-audit-inventory.json`. The tests cover positive and negative proof,
hierarchical children, memory cuts, provider stops, usage, isolation, context,
file handoffs, best-of-five selection, cache, retention and platform JSON.

New asset hashes invalidate old baseline cache entries automatically. Do not
manually reuse old baseline metrics or frozen experiment task roots with the new
evaluator. Future `study-run` qualification uses the current recipe and rejects
missing timing coverage before any model candidates start. This maintenance audit
does not certify that all five existing designs satisfy the newly enforced checks.

An explicit initial-state guard complements the compositional transition proof;
it is not a general state-reencoding or retiming equivalence engine. Unproven
results are rejected rather than interpreted as proof of a bug. Socket timeouts
are I/O timeouts; candidate wall limits are checked at orchestration boundaries,
not hard real-time process deadlines. Resume is not implemented; preserved files
do not automatically resume an interrupted study.
