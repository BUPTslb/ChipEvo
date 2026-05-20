# Repository Guidelines

## Project Goal

ChipEvo uses an LLM to perform **whole-project RTL evolution on existing open-source chip designs that already ship with functional verification strategies**. The objective is to **hierarchically optimize IP-level timing, area, and power** while preserving functional equivalence.

How this differs from existing "single .v file evolution" work:

- The evolution target is a **multi-file, multi-module IP** (CPU core / NPU accelerator / security sub-block), not a self-contained datapath in one file.
- Equivalence verification follows a three-layer framework: **L1 formal / L2 reference model / L3 high-coverage regression**. **Any single layer hitting counts as H2-passed (minimum-strength policy)**. Cadence JasperGold SEC at module boundary is the default L1 fallback.
- PPA conclusions must come from **DC synthesis at the IP top level**, not from per-module local numbers.

The authoritative candidate evaluation lives in [`docs/ChipReport.md`](docs/ChipReport.md). That is the single source of truth for the candidate set, methodology, and experiment ladder.

## Repository Layout

| Path | Contents |
| --- | --- |
| `AGENTS.md` | This file: project intent, toolchain, methodology, agent working rules. |
| `docs/ChipReport.md` | Candidate IP evaluation report (hard constraints, L1/L2/L3 framework, compositionality analysis, experiment ladder, follow-ups). |
| `chips/` | Working trees of candidate IPs (one subdirectory per IP, e.g. `chips/feather/`, `chips/cv32e40p/`). Currently empty; populated in the order of the experiment ladder in `docs/ChipReport.md` §7. |
| `figures/` | Architecture diagrams (one PNG per candidate IP). |


## Toolchain

The commercial tools provided by the school are the baseline of this project. **Do not replace them with open-source alternatives** in the primary feedback loop:

| Tool | Purpose | Position in feedback loop |
| --- | --- | --- |
| **Cadence JasperGold SEC** | Sequential Equivalence Checking at module boundary; L1 fallback | Tier-B (minutes) |
| **Synopsys VCS** | RTL simulation; runs the IP's testbench / ISA regression / UVM | Tier-A smoke and Tier-B full regression |
| **Synopsys Design Compiler (DC)** | Logic synthesis; produces area / timing / power reports | Tier-C IP-level sign-off |

Optional open-source assistance (comparison only, never as a substitute):

- **Synopsys Formality** for L1 combinational equivalence (CEC) as a faster syntactic sanity check.
- Third-party ISS / reference models (Spike, Whisper, OTBNSim, MINISA, NVDLA cmod, etc.) as L2 sources.
- riscv-formal / SymbiYosys only when the candidate IP already ships RVFI / SVA hooks.

## Methodology

### Three-layer equivalence framework (H2)

| Layer | Form | Typical tools | Tolerated evolution scope |
| --- | --- | --- | --- |
| **L1** | Formal equivalence (CEC / SEC) | JasperGold SEC, Formality | Non-functional rewrites up to register retiming / FSM re-encoding |
| **L2** | Interface / ISA equivalence | IP-bundled ISS / cmod, externally-attached Spike | Tolerates micro-arch changes (pipeline depth, branch predictor, etc.) |
| **L3** | Test-set coverage | UVM + functional coverage, riscv-arch-test | Any change; confidence bounded by coverage |

Strategy choice (full derivation in `docs/ChipReport.md` §6):

- **S1 (conservative)**: Interface freeze + per-module SEC. Low optimization power, but directly comparable to single-file reference work.
- **S3 (recommended)**: System-level reference-model-driven + L1 fallback. **Only S3 unlocks cross-module optimization**, which is the core differentiator of this project versus existing single-file work.
- S2 (hierarchical SEC) is not the primary path; engineering cost is too high.

### Evolution feedback loop (Tier-A / B / C)

```
Tier-A  seconds: Formality CEC + VCS smoke regression
Tier-B  minutes: JasperGold SEC at modified module + IP-level ISA / cmod regression
Tier-C  hours:   DC top-level synthesis (area/timing/power) + UVM coverage sign-off
```

**Hard rules**:

1. Any "PPA improvement" claim must come from **DC top-level synthesis**; per-module local numbers are not accepted.
2. JasperGold SEC only proves module-boundary equivalence; **this does not imply IP equivalence**. IP-level functional regression must always be layered on top.
3. Before an evolved artifact becomes the next-round baseline, Tier-A, Tier-B, and Tier-C must **all** pass.

### Generated-RTL policy

Projects where **the RTL is a build artifact rather than source** — VexRiscv, Rocket Chip, BOOM, Gemmini, XiangShan (Chisel / SpinalHDL / FIRRTL generating Verilog) — are **excluded from the first-batch experiments**. Reason: the evolution target would become a snapshot of the build product, severing the upstream high-level semantics. If a "high-abstraction evolution" comparison study is needed in the future, run it as a separate workstream — do not mix it with the hand-written-RTL candidates.

## Working with `chips/`

When introducing a new candidate IP:

1. Sparse clone or submodule the upstream into `chips/<ip-name>/`.
2. **Do not** import generated-RTL ecosystems (Chisel / SpinalHDL / FIRRTL projects).
3. Each IP subdirectory must include a `chips/<ip-name>/NOTES.md` recording: upstream commit, local modifications, build/sim/syn commands, current Tier-A/B/C status, known gaps.
4. Simulation and synthesis logs go under `chips/<ip-name>/build/`; do not pollute upstream directories.
5. Long-running jobs (VCS regression, DC synthesis, JasperGold SEC) must run in `tmux`; record the session name in `NOTES.md`.

## Coding Style & Naming Conventions

- Keep repository-authored content in Markdown unless a script is strictly required.
- Use tables for candidate / tool comparisons; use fenced code blocks for commands.
- Default to ASCII; preserve original characters when quoting project names, upstream terminology, or pre-existing Chinese content.
- **Do not reformat third-party source** under `chips/<ip-name>/`. The only exception is a local-integration bug fix, which must be documented in that IP's `NOTES.md`.

## Testing & Reporting Guidelines

For every Tier-A / B / C run, record:

| Field | Meaning |
| --- | --- |
| Command | Full reproducible command, including environment variables |
| Tool versions | VCS / DC / JasperGold / Verilator / Spike / etc. |
| Workload | Test program, testbench, coverage plan, ISA suite, etc. |
| Pass/fail criteria | Exit code, DiffTest mismatch, coverage threshold, timing slack, area budget |
| Log path | `chips/<ip-name>/build/...` |

Honesty requirements:

- Distinguish "official upstream flow", "locally reproduced", and "inferred".
- Do **not** mark a flow as "verified" unless it has been run on this machine.
- PPA numbers must include the DC synthesis configuration (PDK, constraints, version). Missing any of those means "not signed off".

## Commit & Pull Request Guidelines

- The repository has no historical commits; use clear imperative commits, e.g. `chips: add cv32e40p sparse checkout` or `docs: tighten H2 strength policy`.
- PR descriptions must include:
  - Modified reports / `chips/` subdirectories;
  - Added or removed candidate IPs;
  - Commands run and logs produced;
  - Outstanding toolchain gaps (license, reference-model version, PDK, etc.).
- Do not commit bulky build outputs (`*.fsdb`, synthesis db, Linux rootfs, etc.) unless required for reproduction and small.

## Agent-Specific Instructions

1. **`docs/ChipReport.md` is the single source of truth** for the candidate set and methodology. When changing the IP list / H2 policy / experiment ladder, update the report first, then propagate to other files to avoid drift.
2. **Do not bypass the toolchain**: Yosys is not a substitute for DC; OSS CAD Suite is not a substitute for JasperGold SEC in the primary feedback loop. Open-source tools are for comparison only.
3. **Never** declare a PPA flow "complete" unless:
    - DC top-level synthesis has run locally;
    - JasperGold SEC has passed;
    - The IP's functional regression (VCS / ISS diff / UVM) has passed.
4. When modifying upstream RTL under `chips/<ip-name>/`, the IP's `NOTES.md` **must** mark which pieces are LLM-evolved versus hand-patched, and the change must remain reversible.
5. If a commercial tool license is unavailable, **report the blocker explicitly; do not silently fall back to an open-source tool**. Results from open-source substitutes cannot serve as the baseline.
