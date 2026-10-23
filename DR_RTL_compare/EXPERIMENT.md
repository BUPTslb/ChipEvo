# Comparison Experiment Protocol

## Hypothesis

**H1**: AST subtree selection improves optimization **locality** and **SEC pass rate** vs path-string selection.

**H2**: AST subtree aggregation reduces redundant work when multiple critical paths share the same syntactic region.

**H3**: Primary PPA gains (WNS/TNS score) are **not worse** than baseline under the same iteration budget.

## Fairness constraints (mandatory)

Both tracks MUST use:

| Item | Source |
|------|--------|
| Baseline RTL (v0) | `DR_RTL/rtl_dataset/` |
| Scoring formula | `shared/scoring.json` (identical to DR_RTL CLAUDE.md) |
| DC + SEC toolchain | `DR_RTL/syn_flow_eda/` via `shared/eda_env.sh` |
| Clock / library | Nangate 45nm, `syn.tcl` period 0.1ns |
| Iteration budget | 10 majors × 5 minors (configurable in `compare.yaml`) |
| Golden for SEC | Always `<design>.v0` |

Only **one** variable changes between tracks:

- **baseline**: path-driven analyze → text optimize
- **ast**: AST parse → timing-annotated subtree rank → subtree rewrite

## Experiment suites

Defined in `compare.yaml`:

| Suite | Designs | Purpose |
|-------|---------|---------|
| `smoke` | `cpu_fsm` | Pipeline sanity |
| `pilot` | `cpu_fsm`, `vending_machine` | Primary paper-style comparison |
| `full` | All 20 designs in `shared/design_set.json` | Scale study |

## Per-iteration workflow (both tracks)

```
v0 evaluate → major loop (v0..v9):
  for minor in 1..5:
    ANALYZE  → record analysis artifact
    OPTIMIZE → emit <design>.vX.Y.v
    EVALUATE → run_evaluate.py (DC + SEC via evaluator agent)
    RECORD   → iter.json + append history.json
  SELECT best SEC-pass minor → promote to next major
stop at v10 or no_improvement
```

## Track-specific artifacts

### Baseline (`results/baseline/`)

Mirrors DR_RTL layout under `syn_flow/`:

- `log/<design>.<version>.iter.json` — `critical_paths[]`, diversity strategy
- Copied or linked from `DR_RTL/syn_flow/` after each run

### AST (`results/ast/`)

Same as baseline, plus AST artifacts under `ast/artifacts/`:

- `ast/<design>.<version>.json` — serialized AST (or IR handle + metadata)
- `subtrees/<design>.<version>.json` — top-k ranked subtrees with scores
- `rewrites/<design>.<version>.json` — applied pattern / subtree ids

Extended `iter.json` fields (AST track only):

```json
{
  "analysis_mode": "ast_subtree",
  "critical_subtrees": [{"id": "...", "score": 0.82, "pattern": "mux_before_adder"}],
  "rewrite": {"subtree_ids": ["..."], "pattern_id": "...", "lines_touched": 12}
}
```

## Metrics

### Primary (PPA outcome)

| Metric | Definition |
|--------|------------|
| `best_score` | Lowest score among SEC-pass versions (vs v0 baseline) |
| `best_wns` / `best_tns` / `best_area` | PPA at `best_version` |
| `sec_pass_rate` | SEC-pass minors / total minors |
| `majors_with_promotion` | Count of major rounds that promoted |

### Secondary (method efficiency)

| Metric | Definition |
|--------|------------|
| `iterations_to_best` | Minor index when global best first achieved |
| `lines_changed` | Diff lines vs parent major version |
| `subtree_coverage` | Fraction of critical paths explained by chosen subtrees (AST only) |
| `analyzer_latency_s` | Wall time for analyze step |
| `duplicate_path_ratio` | Paths hitting same region (baseline only; AST should be lower) |

### Guardrails

| Metric | Threshold (alert if violated) |
|--------|-------------------------------|
| SEC pass rate | AST should not be >10pp below baseline on pilot |
| Area at best | Area_norm > 0.10 penalty rate comparable |
| EDA wall time | Within 2× baseline (AST parse overhead) |

## Reporting

`scripts/generate_report.py` emits:

- Per-design side-by-side table
- Suite-level aggregates (mean/median sec_pass_rate, best_score)
- Win/tie/loss count (AST vs baseline on best_score)

## Reproducibility checklist

- [ ] Record hostname, `env_chip.sh` DC_HOME, tool versions in `results/<track>/meta.json`
- [ ] Pin suite name and `compare.yaml` hash in each run log
- [ ] Do not edit `DR_RTL/` during experiments
- [ ] Copy `output/` snapshots into `results/` after each evaluate step
