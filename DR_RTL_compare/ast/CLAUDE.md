# CLAUDE.md — AST Track Orchestrator

**Inherits all rules from [`DR_RTL/CLAUDE.md`](../../DR_RTL/CLAUDE.md)**:

- Versioning (v0 … v10, 5 minors per major)
- Scoring formula and baseline = v0
- End criteria (`max_major_reached`, `no_improvement`)
- Orchestrator delegates to sub-agents; does not synthesize or rewrite RTL directly
- RECORD / SELECT / PROMOTE performed by orchestrator

## Single Variable Change (AST Track)

Replace path-driven analyze/optimize with **AST subtree** analyze/optimize. Everything else identical.

| Step | Baseline (DR_RTL) | AST (this track) |
|------|-------------------|------------------|
| ANALYZE | `@agent-rtl-timing-analyzer` | `@agent-rtl-ast-analyzer` + `ast_ir/pipeline.py` |
| OPTIMIZE | `@agent-rtl-optimizer` | `@agent-rtl-ast-optimizer` |
| EVALUATE | `@agent-rtl-synthesis-evaluator` | `@agent-rtl-ast-evaluator` |
| RECORD | orchestrator | orchestrator (same formula) |

Working directory for this track: **`DR_RTL_compare/ast/`** (MiMo CN endpoint).

---

## File Layout (AST Track)

```
ast/
├── syn_flow/
│   ├── rtl/<design>.<version>.v
│   ├── log/<design>.<version>.iter.json
│   ├── history/<design>.history.json
│   └── output/<design>.<version>/
├── artifacts/
│   ├── ast/<design>.<version>.json
│   ├── subtrees/<design>.<version>.json
│   └── rewrites/<design>.<version>.json
└── ast_ir/pipeline.py
```

EDA toolchain: shared `DR_RTL/syn_flow_eda/` (via `syn_flow/run_evaluate.py`).

---

## Workflow Per Minor

1. **ASSIGN** — Orchestrator sets `diversity_strategy` (baseline rotation + AST-specific options below).
2. **ANALYZE** — `@agent-rtl-ast-analyzer`
   - Runs `ast_ir/pipeline.py` (subprocess)
   - Writes `syn_flow/log/<design>.<version>.iter.json` with `critical_subtrees[]`
3. **OPTIMIZE** — `@agent-rtl-ast-optimizer`
   - Bounded rewrite on ranked subtrees only
   - Writes `syn_flow/rtl/<design>.<version>.v`
   - Writes `artifacts/rewrites/<design>.<version>.json`
4. **EVALUATE** — `@agent-rtl-ast-evaluator` → `syn_flow/run_evaluate.py`
5. **RECORD** — Orchestrator: same scoring as DR_RTL

### After All 5 Minors

Same SELECT / PROMOTE as DR_RTL: best SEC-pass minor → next major RTL file.

---

## Diversity Strategy (AST-Specific)

In addition to baseline path-selection rotation, set in `iter.json`:

```json
"diversity_strategy": {
  "minor_index": 1,
  "path_selection": "top-K by slack",
  "optimization_focus": "combinational",
  "subtree_rank_offset": 0,
  "pattern_focus": "combinational",
  "coverage_first": false,
  "hint": null
}
```

| Minor | subtree_rank_offset | pattern_focus | coverage_first |
|-------|---------------------|---------------|----------------|
| 1 | 0 | combinational | false |
| 2 | 2 | sequential | false |
| 3 | 0 | mixed | true |
| 4 | 4 | combinational | false |
| 5 | 6 | sequential | true |

Pass `--rank-offset` to `pipeline.py` from `compare.yaml` → `ast.granularity.rank_offset_minors[minor_index - 1]`.

## Subtree granularity

Ranked subtrees are **L2 process containers** (slang). **Do not mutate whole blocks directly.**

Before OPTIMIZE, read `ast/.claude/skill/rtl-subtree-granularity/skill.md`:

1. Pipeline ranks L2 spans with `mutable: false`
2. Optimizer decomposes span → **L5 assignment-slices** (one target + guards)
3. Apply `rtl-opt` transforms at L5–L6 only
4. Respect `semantic_tag` and `freeze_semantic_tags` in `compare.yaml`

---

## iter.json Extensions (Required)

```json
{
  "analysis_mode": "ast_subtree",
  "design": "<design>",
  "base_version": "v0",
  "target_version": "v0.1",
  "diversity_strategy": { },
  "wns_before": -0.82,
  "tns_before": -429.73,
  "area_baseline": 32267,
  "critical_subtrees": [
    {
      "id": "st_0042",
      "level": 2,
      "kind": "process_container",
      "span": {"start_line": 98, "end_line": 177, "ast_type": "ProceduralBlock"},
      "write_set": ["PC", "IR"],
      "read_set": ["state", "IR"],
      "semantic_tag": "state_update",
      "risk_level": 4,
      "mutable": false,
      "mutation_guidance": "Decompose to L5 assignment-slices before rtl-opt transforms",
      "score": 0.87,
      "min_slack": -0.41,
      "path_coverage": 0.35,
      "pattern_candidates": ["condition_precompute"]
    }
  ],
  "rewrite": {
    "subtree_ids": ["st_0042"],
    "refined_level": 5,
    "target_signal": "PC",
    "pattern_id": "condition_precompute",
    "lines_touched": 14
  },
  "evaluation": { },
  "scoring": { }
}
```

---

## Initialize Design

Same as DR_RTL, paths under `ast/syn_flow/`:

1. Seed `v0` from `DR_RTL/rtl_dataset/`
2. `@agent-rtl-ast-evaluator` for `v0`
3. Create `syn_flow/history/<design>.history.json` with `"track": "ast_subtree"`

---

## Agent Delegation Templates

### ANALYZE

```
@agent-rtl-ast-analyzer

Design: <design>
Best version: <best_version>
Target version: <target_version>
Diversity strategy: <JSON>
Pipeline:
  python3 ast_ir/pipeline.py \
    --rtl syn_flow/rtl/<design>.<best_version>.v \
    --timing syn_flow/output/<design>.<best_version>/timing_word.json \
    --design <design> --version <target_version> \
    --top-k 10 \
    --out artifacts/subtrees/<design>.<target_version>.json
Write: syn_flow/log/<design>.<target_version>.iter.json
```

### OPTIMIZE

```
@agent-rtl-ast-optimizer

Design: <design>
Base: <best_version>
Target: <target_version>
Read RTL: syn_flow/rtl/<design>.<best_version>.v
Read iter: syn_flow/log/<design>.<target_version>.iter.json
Read subtrees: artifacts/subtrees/<design>.<target_version>.json
Read patterns: ast_ir/patterns/
Read skills (reference): DR_RTL/.claude/skill/rtl-opt/skill.md
Write RTL: syn_flow/rtl/<design>.<target_version>.v
Write rewrite log: artifacts/rewrites/<design>.<target_version>.json
```

### EVALUATE

```
@agent-rtl-ast-evaluator

design_name: <design>
design_version: <target_version>
```

Runs **only**:

```bash
cd syn_flow && python3 run_evaluate.py <design> <target_version>
```

---

## Six-Design Comparison Suite

Config: `../suite/suite_designs.json` (same design list as baseline).

Run sequentially in a **separate Cursor session** (AST workspace = `DR_RTL_compare/ast/`):

```
Run compare6 AST per ast/CLAUDE.md and suite/suite_designs.json.
MiMo CN endpoint. Do not modify DR_RTL/.
```

See `../suite/ORCHESTRATOR.md`.

---

## Fairness

- Do **not** modify `DR_RTL/` during AST experiments
- Same iteration budget: 10 × 5
- Same DC + SEC flow and SEC golden = v0
- Only analyze/optimize inputs differ (subtrees vs path strings)

---

## User Commands

| User says | Action |
|-----------|--------|
| "Optimize `<design>` AST" | Full loop for one design on AST track |
| "Run compare6 AST" | Sequential six-design suite |
| "Continue `<design>` AST" | Resume from `syn_flow/history/<design>.history.json` |
