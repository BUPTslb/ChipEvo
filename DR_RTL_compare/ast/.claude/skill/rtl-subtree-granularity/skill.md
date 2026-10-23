# Skill: RTL Subtree Granularity (AST Track)

Use when **selecting, ranking, or mutating** subtrees in `DR_RTL_compare/ast/`. Works with `ast_ir/pipeline.py` (slang) and `@agent-rtl-ast-optimizer`.

Timing transforms still reference `DR_RTL/.claude/skill/rtl-opt/skill.md`. This skill defines **where** to apply them, not **which** transform.

---

## Core Principle

Do **not** treat a whole `always` or `assign` process as the primary mutation unit.

A useful subtree has:

- Clear **read_set** and **write_set**
- Limited modification scope
- Preserved clock/reset / assignment semantics
- Verifiable equivalence boundary (SEC golden = v0)

Use a **multi-level hierarchy**. Process blocks from slang are **containers (L2)**; default mutation targets are **assignment-slice (L5)** and **expression (L6)**.

---

## Level Map (DR_RTL_compare)

| Level | Name | slang / pipeline today | Role |
|-------|------|------------------------|------|
| L1 | module | whole `.v` file | Container only |
| L2 | process | `ProceduralBlock`, `ContinuousAssign` | **Rank pool (current)** — container, not direct mutate |
| L3 | semantic_region | (planned: reset / next-state / decode regions) | Preferred mid-level target |
| L4 | statement | `if` / `case` / guarded branch | Control-structure edits |
| L5 | assignment_slice | one target + guards + RHS | **Default mutation unit** |
| L6 | expression | RHS / guard expr subtree | Safest local rewrites |
| L7 | operator | single op + operands | Canonicalization only |

Pipeline output today is **L2**. Optimizer must **refine downward** to L5–L6 inside the ranked span before applying `rtl-opt` strategies.

---

## Default Mutation Policy (first-stage)

**Allow** (when within ranked span):

- L6 expression rewrites (Boolean, mux, arithmetic)
- L5 single-target guarded updates
- L4 small write_set statements (≤2 related signals)

**Freeze** (`mutable: false`):

- Clock / reset generation and distribution
- CDC / handshake / memory-macro protocol regions
- Module ports and parameters
- Whole L2 process rewrite without L5 decomposition
- `semantic_tag: protected_region | reset | memory_interface`

---

## Granularity Selection Rules

### R1 — Prefer clear write set

Good: `write_set = {PC}` or `{IR}`  
Risky: many unrelated signals → split by target or semantic region before mutate.

### R2 — Preserve timing context

Do not mix in one mutable subtree:

- Sequential vs combinational
- Different clock domains
- Reset vs normal update
- Blocking-assignment dependency chains

### R3 — Match transform to level

| Transform (from rtl-opt) | Subtree level |
|--------------------------|---------------|
| constant fold, CSE, tree balance | L6 |
| mux restructure, condition precompute | L5–L6 |
| branch merge / case simplify | L4 |
| FSM / update-policy change | L3–L5 |
| pipeline / module restructure | L1–L2 (late, high risk) |

### R4 — Process container workflow

When `critical_subtrees[].level == 2`:

1. Read `span.start_line` … `span.end_line`
2. Split into **target-centered assignment slices (L5)** per register/output in `write_set`
3. Pick 1–2 slices touched by worst timing paths
4. Apply one `rtl-opt` strategy per slice
5. Record `refined_subtree_id`, `level`, `lines_touched` in `artifacts/rewrites/`

---

## Required Subtree Metadata

Each entry in `artifacts/subtrees/*.json` should include (see `ast_ir/subtree_schema.json`):

```json
{
  "id": "st_0000",
  "level": 2,
  "kind": "process_container",
  "span": { "start_line": 98, "end_line": 177, "ast_type": "ProceduralBlock" },
  "read_set": ["IR", "state"],
  "write_set": ["PC", "IR"],
  "semantic_tag": "state_update",
  "risk_level": 3,
  "mutable": false,
  "mutation_guidance": "Decompose to L5 assignment-slices before rtl-opt transforms",
  "pattern_candidates": ["condition_precompute"]
}
```

---

## Diversity (orchestrator)

Map `diversity_strategy` from `ast/CLAUDE.md`:

| Field | Effect |
|-------|--------|
| `subtree_rank_offset` | Skip top-N ranked subtrees |
| `pattern_focus` | combinational → prefer L6; sequential → L5/L3 |
| `coverage_first` | Prefer subtrees covering more distinct paths |

---

## Validation (AST track)

After optimizer edit:

1. **Static**: syntax, no new multi-drivers, span boundary respected
2. **SEC**: `run_evaluate.py` vs v0 (mandatory)
3. **Rewrite log**: `artifacts/rewrites/<design>.<version>.json` with `subtree_ids`, `level`, `pattern_id`

---

## Reference

Full derivation: [`rtl_subtree_granularity_skill.md`](../../../../rtl_subtree_granularity_skill.md) (repo root).
