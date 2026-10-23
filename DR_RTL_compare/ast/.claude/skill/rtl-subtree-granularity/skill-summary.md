# RTL Subtree Granularity (condensed)

Use with `@agent-rtl-ast-optimizer`. Full skill: `rtl-subtree-granularity/skill.md`.

## Core rule

Do **not** mutate whole L2 process containers. Decompose ranked spans to **L5 assignment-slices** (one target + guards), then apply `rtl-opt` at L5–L6 only.

## Level map

| Level | Role |
|-------|------|
| L1 module | Container only |
| L2 process | Rank pool — **not** direct mutate |
| L5 assignment_slice | **Default mutation unit** |
| L6 expression | Safest local rewrites |

## Workflow (L2 → L5)

1. Read `span.start_line` … `span.end_line` from ranked subtree
2. Split into target-centered L5 slices per signal in `write_set`
3. Pick 1–2 slices on worst timing paths
4. Apply one `rtl-opt` strategy per slice
5. Log `subtree_ids`, `refined_level`, `pattern_id`, `lines_touched`

## Freeze (`mutable: false`)

Clock/reset, CDC/handshake, ports/parameters, whole L2 rewrite without L5 decomposition, `semantic_tag: protected_region | reset | memory_interface`.

## Transform ↔ level

| Transform | Level |
|-----------|-------|
| constant fold, CSE, tree balance | L6 |
| mux restructure, condition precompute | L5–L6 |
| branch merge / case simplify | L4 |
| FSM / update-policy change | L3–L5 |

## Validation

- Respect span boundaries; no new multi-drivers
- SEC golden = v0 (via `run_evaluate.py`)
- Record rewrite in `artifacts/rewrites/<design>.<version>.json`
