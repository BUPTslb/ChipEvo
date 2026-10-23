# AST rewrite patterns (YAML)

Each pattern defines:
- `id`: matches `rtl-opt/skill.md` strategy names where possible
- `min_level` / `max_level`: subtree granularity (see `rtl-subtree-granularity` skill)
- `ast_match`: structural predicate (TBD — DSL or slang CST hook)
- `rewrite`: template or agent instruction stub

## Granularity mapping

| Pattern | Min level | Max level |
|---------|-----------|-----------|
| constant fold, CSE | L6 | L7 |
| mux_before_adder, tree_balancing | L5 | L6 |
| condition_precompute | L5 | L5 |
| fsm_reencode | L3 | L5 |
| register_duplication | L5 | L5 |

See `ast/.claude/skill/rtl-subtree-granularity/skill.md`.

## Pilot patterns (from DR_RTL skill.md)

| id | Baseline skill # |
|----|------------------|
| condition_precompute | 2 |
| mux_before_adder | 7 |
| one_hot_predecode | 1 |

Example layout:

```yaml
# patterns/mux_before_adder.yaml
id: mux_before_adder
min_level: 5
max_level: 6
description: Restructure sel?(A+B):(C+D) to (sel?A:C)+(sel?B:D)
amenability: medium
ast_match:
  node_type: conditional_expression
  children_contains: [adder, adder]
rewrite:
  strategy: agent_guided
```

Optimizer selects pattern by `pattern_candidates` on ranked subtrees after L5 refinement.
