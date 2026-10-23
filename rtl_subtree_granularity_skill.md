# Skill: RTL Subtree Granularity for Evolutionary Optimization

> **Adapted into DR_RTL_compare:** [`DR_RTL_compare/ast/.claude/skill/rtl-subtree-granularity/skill.md`](DR_RTL_compare/ast/.claude/skill/rtl-subtree-granularity/skill.md)  
> Implementation: `ast/ast_ir/granularity.py`, `compare.yaml` → `ast.granularity`.

## Purpose

Use this skill when building an RTL evolution or optimization framework that represents RTL as a tree-like structure. The goal is to choose useful subtree granularities so that optimization can be applied locally, safely, and repeatedly instead of rewriting an entire design block at once.

This skill focuses on subtree abstraction, optimization scope, and safe transformation boundaries. It does not assume any specific hardware IP name, accelerator type, or module name.

---

## Core Principle

Do not define a subtree only as a syntactic block such as a whole `always` block or a `begin-end` block. A useful RTL subtree should represent a meaningful hardware behavior, such as one output signal, one register update, one guarded assignment, one control decision, or one expression.

A good subtree should have:

- A clear read set and write set
- A clear functional role
- A limited modification scope
- A well-defined clock/reset context, if sequential
- A verifiable equivalence boundary
- A low chance of unintentionally changing unrelated logic

The recommended approach is to maintain a multi-level subtree hierarchy rather than relying on a single fixed subtree size.

---

## Recommended Subtree Hierarchy

```text
Design
└── Module-level subtree
    └── Process-level subtree
        └── Semantic-region subtree
            └── Statement-level subtree
                └── Assignment-slice subtree
                    └── Expression-level subtree
                        └── Operator-level subtree
```

Each level has a different optimization role, risk level, and expected benefit.

---

## Level 0: Design-Level Subtree

### Meaning

The design-level subtree represents the complete RTL design or a large top-level subsystem. It includes multiple modules, their hierarchy, interconnections, and global interfaces.

### Typical Contents

- Top-level module hierarchy
- Global clock/reset structure
- External interfaces
- Major submodules
- High-level data/control paths

### Possible Optimization Directions

- Restructuring the hierarchy
- Changing high-level connectivity
- Introducing or removing intermediate buffering
- Changing global pipeline structure
- Repartitioning logic across modules
- Adjusting interface-level flow control

### Risk Level

Very high.

### Recommendation

Do not use this as the default evolution unit. Use it only for late-stage architectural exploration after smaller transformations have already been validated.

---

## Level 1: Module-Level Subtree

### Meaning

A module-level subtree represents one RTL module and its internal implementation. It usually contains ports, parameters, declarations, continuous assignments, procedural blocks, and instantiated submodules.

### Typical Contents

- Port declarations
- Parameter/localparam declarations
- Internal signals
- Continuous assignments
- Sequential processes
- Combinational processes
- Submodule instances

### Possible Optimization Directions

- Replacing one implementation with an equivalent implementation
- Splitting or merging internal logic
- Refactoring internal datapath/control boundaries
- Adding or removing pipeline registers
- Reorganizing local buffering
- Modifying internal resource sharing

### Risk Level

High.

### Recommendation

Use module-level subtrees for coarse-grained optimization only when the module has a clear contract and strong verification support. For early-stage RTL evolution, treat the module as a container rather than the primary mutation unit.

---

## Level 2: Process-Level Subtree

### Meaning

A process-level subtree represents one procedural or continuous process, such as an `always_ff`, `always_comb`, `always @(*)`, or `assign` block.

### Typical Contents

- One sequential block
- One combinational block
- One continuous assignment
- Sensitivity information
- Assignment statements inside the process

### Possible Optimization Directions

- Splitting a large process into smaller processes
- Merging related processes when safe
- Refactoring combinational logic
- Separating next-state logic from output logic
- Converting simple combinational blocks into continuous assignments
- Cleaning default assignments and branch structure

### Risk Level

Medium to high.

### Recommendation

A whole process is usually too coarse as the main subtree for RTL evolution. Keep it as a root container, then split it into smaller semantic regions, assignment slices, and expression trees.

---

## Level 3: Semantic-Region Subtree

### Meaning

A semantic-region subtree is a behaviorally meaningful region inside a process. Instead of following only syntax, this level groups logic according to its hardware role.

### Typical Semantic Regions

- Reset behavior
- Register update behavior
- Next-state computation
- Output decode behavior
- Counter or index update behavior
- Address or offset generation behavior
- Handshake or flow-control behavior
- Status-flag update behavior
- Datapath update behavior
- Default assignment region

### Possible Optimization Directions

- Simplifying update conditions
- Reordering independent guarded updates
- Extracting common enable conditions
- Simplifying default/override structures
- Reducing duplicated control logic
- Local retiming within a well-defined region
- Separating control logic from datapath logic

### Risk Level

Medium.

### Recommendation

This is one of the most useful levels for RTL evolution. It is large enough to capture meaningful hardware behavior, but small enough to avoid modifying unrelated logic. Prefer this level for transformations that affect control structure, update policy, or local datapath organization.

---

## Level 4: Statement-Level Subtree

### Meaning

A statement-level subtree represents a structured statement such as an `if`, `else-if`, `case`, loop-generated statement, or a compound statement that controls a small group of assignments.

### Typical Contents

- One conditional branch
- One case statement
- One nested decision structure
- One group of assignments under the same guard
- One local control tree

### Possible Optimization Directions

- Flattening nested conditionals
- Merging equivalent branches
- Removing unreachable branches
- Simplifying case/default structures
- Extracting common assignments from multiple branches
- Reordering priority conditions when provably safe
- Rewriting control logic into simpler Boolean expressions

### Risk Level

Medium.

### Recommendation

Use this level when optimizing control structure. Always track the write set of the statement. A statement-level subtree that writes many unrelated signals should be split into smaller subtrees before optimization.

---

## Level 5: Assignment-Slice Subtree

### Meaning

An assignment-slice subtree represents one target signal update together with the conditions under which the update occurs. This is often the best default unit for RTL evolution.

Instead of treating an assignment as only `lhs = rhs`, represent it as:

```text
guard condition + target signal + right-hand-side expression + assignment type + timing context
```

### Typical Contents

- Target signal
- Guard condition
- Right-hand-side expression
- Blocking or nonblocking assignment type
- Clock/reset context if sequential
- Default or hold behavior
- Bit width information

### Example Abstract Form

```text
Update(target)
├── guard_1 -> value_1
├── guard_2 -> value_2
├── guard_3 -> value_3
└── otherwise -> default_or_hold_value
```

### Possible Optimization Directions

- Simplifying guarded update conditions
- Removing redundant updates
- Merging equivalent guarded assignments
- Simplifying hold/default behavior
- Rewriting update expressions
- Reducing unnecessary enable logic
- Preserving the same target while optimizing the update function

### Risk Level

Low to medium.

### Recommendation

This should be the primary subtree granularity for the first practical implementation. It has a clear write set, usually one target signal, and can be validated more easily than a whole process or module.

For sequential logic, build one update tree per assigned register. For combinational logic, build one output tree per assigned output or temporary signal, while preserving assignment ordering when blocking assignments introduce dependencies.

---

## Level 6: Expression-Level Subtree

### Meaning

An expression-level subtree represents the right-hand side of an assignment or a sub-expression inside it. It directly corresponds to arithmetic, Boolean, comparison, bit-selection, concatenation, or multiplexing logic.

### Typical Contents

- Arithmetic operators
- Boolean operators
- Comparisons
- Conditional expressions
- Bit slicing
- Concatenation
- Replication
- Shifts
- Casts and width extensions
- Constants and identifiers

### Possible Optimization Directions

- Boolean algebra rewriting
- Constant propagation
- Strength reduction
- Common sub-expression extraction
- Width reduction
- Comparator simplification
- Multiplexer simplification
- Arithmetic reassociation when safe
- Removing identity operations
- Rewriting expressions to reduce logic depth

### Risk Level

Low.

### Recommendation

This is the safest subtree level for equivalence-preserving transformations. It is ideal for early-stage evolution, automated rewrite rules, and local cost-guided search. However, single expression changes may provide smaller gains than region-level or module-level transformations.

---

## Level 7: Operator-Level Subtree

### Meaning

An operator-level subtree is a single operation and its immediate operands.

### Typical Contents

- One addition, subtraction, multiplication, shift, comparison, bitwise operation, logical operation, or mux-like operation
- Immediate child operands
- Local bit width/sign information

### Possible Optimization Directions

- Replacing identity operations
- Simplifying operations with constants
- Reordering commutative operands
- Replacing expensive operations with cheaper equivalents when valid
- Reducing bit width of a local operation
- Applying canonicalization rules

### Risk Level

Very low.

### Recommendation

Use this level for safe canonicalization and local simplification. It is especially useful as a preprocessing or cleanup pass before larger subtree evolution.

---

## Recommended Default Granularity

For a practical RTL evolution framework, the recommended default subtree levels are:

```text
1. Assignment-slice subtree
2. Expression-level subtree
3. Semantic-region subtree
```

Use these as the main optimization targets.

Keep larger levels such as process-level and module-level subtrees as containers or late-stage optimization units.

---

## Granularity Selection Rules

### Rule 1: Prefer a Clear Write Set

A good subtree should write only one signal or a small related group of signals.

Good:

```text
write_set = {target_signal}
```

Risky:

```text
write_set = {many unrelated signals}
```

If a subtree writes many unrelated signals, split it by target signal or semantic region.

---

### Rule 2: Preserve Timing Context

Do not mix logic from different timing contexts in the same mutable subtree.

Separate:

- Different clock domains
- Reset logic and normal update logic
- Sequential logic and combinational logic
- Blocking-assignment-dependent logic and independent assignments

Clock-domain crossing logic should usually be marked as a protected region during early-stage optimization.

---

### Rule 3: Preserve Assignment Semantics

Nonblocking assignments in sequential logic can often be separated by target register.

Blocking assignments in combinational logic may have ordering dependencies. When splitting combinational processes, preserve temporary-variable dependencies and statement order.

---

### Rule 4: Freeze High-Risk Regions Initially

In the first implementation, avoid mutating regions that affect:

- Clock and reset generation
- Clock-domain crossing
- Memory macro protocols
- External interfaces
- Test/debug logic
- Black-box or vendor-specific modules
- Highly timing-sensitive handshakes

These regions can be analyzed and represented in the tree but should not be mutated until the framework has stronger validation support.

---

### Rule 5: Match Transformation Type to Subtree Level

Use small subtrees for safe local equivalence transformations. Use larger subtrees only when the optimization requires structural changes.

| Transformation Type | Recommended Level |
|---|---|
| Constant simplification | Expression / Operator |
| Boolean rewriting | Expression |
| Arithmetic simplification | Expression |
| Guard simplification | Assignment slice / Statement |
| Redundant branch removal | Statement |
| Update-policy rewrite | Assignment slice / Semantic region |
| Control-structure rewrite | Statement / Semantic region |
| Local datapath reorganization | Semantic region |
| Pipeline insertion | Semantic region / Module |
| Interface or hierarchy change | Module / Design |

---

## Suggested Subtree Metadata

Each subtree should store enough information to support safe selection, mutation, and verification.

```python
class RTLSubtree:
    id: str
    kind: str
    level: int

    parent_id: str | None
    children_ids: list[str]

    source_file: str
    source_range: tuple

    module_name: str
    process_id: str | None

    read_set: set[str]
    write_set: set[str]

    guard_condition: object | None
    lhs_set: set[str]
    rhs_signals: set[str]

    is_sequential: bool
    is_combinational: bool
    assignment_type: str | None

    clock_signal: str | None
    reset_signal: str | None

    bitwidth_info: dict
    parameter_deps: set[str]

    semantic_tag: str | None
    risk_level: int
    mutable: bool
```

Minimum required metadata:

```text
kind
level
source_range
read_set
write_set
guard_condition
is_sequential / is_combinational
assignment_type
bitwidth_info
semantic_tag
risk_level
```

---

## Practical Implementation Strategy

### Step 1: Keep Existing Process Blocks as Roots

If the current system already treats each process block as one subtree, keep that representation as a container level.

Do not discard it. Instead, build smaller subtrees under it.

---

### Step 2: Split Sequential Processes by Target Register

For sequential logic, construct one update tree per assigned register.

Each update tree should include:

- Reset value if present
- Guarded update cases
- Hold behavior
- RHS expressions
- Assignment type
- Clock/reset context

This converts a large process into several smaller, target-centered subtrees.

---

### Step 3: Split Combinational Processes by Output Target

For combinational logic, construct one output tree per assigned output or internal temporary signal.

Be careful with blocking assignments. If later assignments depend on earlier temporary variables, preserve the dependency chain.

---

### Step 4: Build Expression Trees for RHS Logic

For every assignment-slice subtree, build an expression tree for the right-hand side and for relevant guard conditions.

This enables local rewriting and equivalence-preserving transformations.

---

### Step 5: Add Semantic Tags

Assign semantic tags based on signal names, usage patterns, structural context, and data/control dependencies.

Useful generic tags include:

- reset
- state_update
- next_state_logic
- output_decode
- counter_update
- address_generation
- index_update
- flow_control
- status_flag
- datapath_update
- arithmetic_compute
- comparison_logic
- memory_interface
- protected_region

Tags do not need to be perfect initially. They are used to guide mutation rules and risk control.

---

### Step 6: Use a Multi-Level Subtree Pool

Maintain a subtree pool containing all levels:

```text
module-level subtrees
process-level subtrees
semantic-region subtrees
statement-level subtrees
assignment-slice subtrees
expression-level subtrees
operator-level subtrees
```

Then select mutation targets based on optimization goal, risk tolerance, and validation budget.

---

## Safe First-Stage Mutation Policy

For the first working version, allow mutations only on:

- Expression-level subtrees
- Operator-level subtrees
- Assignment-slice subtrees with one target signal
- Statement-level subtrees with small write sets

Freeze:

- Clock/reset generation
- Cross-clock logic
- External protocol logic
- Memory macro timing logic
- Black-box interfaces
- Large process-level rewrites
- Whole-module rewrites

This gives a stable starting point with a high probability of generating valid candidates.

---

## Validation Requirements

Every mutated subtree should pass a staged validation flow.

### Static Checks

- Syntax correctness
- Width consistency
- Signedness consistency
- No new latch unless intentional
- No new combinational loop
- No illegal multiple drivers
- No changed clock/reset context unless intentional
- No changed assignment type unless intentional

### Functional Checks

- Local equivalence check where possible
- Module-level equivalence check where possible
- Full testbench simulation
- Assertion/property checks if available

### QoR Checks

- Logic depth
- Area estimate
- Timing estimate
- Power estimate if available
- Synthesis result comparison

---

## Final Recommendation

For RTL evolution, the best practical subtree is not a whole process block. The main mutation unit should be centered around one target signal update and its guarded behavior.

Recommended default:

```text
Process block as container
└── Semantic region
    └── Target-centered update tree
        └── Guarded assignment slice
            └── RHS / guard expression tree
```

This structure provides a good balance between safety, locality, semantic meaning, and optimization potential.
