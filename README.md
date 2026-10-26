# ChipEvo

A file-based framework for LLM-assisted, cycle-preserving RTL timing and area optimization.

ChipEvo gives an agent source-level access to an isolated RTL candidate, localizes optimization opportunities using whole-design evidence, and evaluates the result against a frozen reference. It supports ZipCPU, Gemmini, VectorCGRA, Feather, and NVDLA. This repository contains the maintained framework and benchmark inputs, not experiment histories or generated candidates.

## Workflow

1. Freeze the reference RTL, design configuration, memory implementation, libraries, and constraints.
2. Provide module/source indexes and baseline localization evidence to the model.
3. Generate independent candidates in separate directories. All model-facing prompts are English.
4. Validate the modification policy and prove cycle-preserving equivalence.
5. Synthesize and analyze the complete top-level design under the same recipe as its reference.
6. Score feasible candidates and select the best result for an explicitly configured subsequent round.

The round-feedback protocol disables in-candidate EDA feedback. Evaluation follows generation; feedback belongs to the next round. Candidate workspaces, progress records, and results are isolated. Source edits do not silently change the immutable reference.

## Repository layout

| Path | Purpose |
| --- | --- |
| `chipevo/` | Agent loop, provider adapters, context/progress memory, scheduling, evaluation and scoring |
| `chipevo/eda/` | Yosys/ABC synthesis, formal equivalence and OpenSTA integration |
| `designs/<id>/rtl/` | Frozen candidate starting RTL |
| `designs/<id>/reference/` | Evaluator-owned reference RTL |
| `designs/<id>/manifest.json`, `policy.json` | Top-level configuration and permitted modifications |
| `designs/<id>/context/` | Frozen localization inputs, not generated candidate results |
| `technology/` | Technology libraries and fixed memory assets |
| `configs/tasks/` | Per-design timing/area evaluation contracts |
| `configs/studies/example.json` | Credential-free one-round, five-candidate configuration |
| `prompts/` | English task templates |
| `grading/` | Trusted platform grading entry points |
| `tools/` | Reusable validation, packaging and dependency helpers |
| `tests/` | Regression tests using synthetic fixtures and mocked providers |
| `docs/` | Detailed engineering contracts and operating notes |

Generated `artifacts/`, `reports/`, `archive/`, `dist/`, caches, environments, credentials and native runtime payloads are ignored. Upstream bulk NVDLA trace stimuli are also omitted; they are not required by the formal/synthesis scoring path. Third-party RTL and library notices remain with their assets.

## Requirements and installation

Use Linux x86-64 and Python 3.10 or newer. Run commands from the repository root.

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
python -m chipevo --help
python -m unittest discover -s tests
```

The Python dependency is pinned in `requirements.txt`. Native EDA tools are separate dependencies: Yosys (including ABC) and OpenSTA. `configs/toolchain.json`, `tools/runtime/FILES.sha256.json` and runtime provenance record the expected build and file inventory. No commercial EDA installation is required.

### Native runtime

Git contains runtime pins, wrappers' inventory, provenance and license notices, but not executables/shared libraries. Restore a matching Linux runtime bundle under `tools/runtime/`, preserving executable permissions, then run:

```bash
python tools/doctor.py
```

`doctor` verifies runtime files and starts version/help checks; it does not synthesize a design. On the original workstation the validated runtime remains in the working project and publication copy. A fresh Git clone needs that runtime provisioned before EDA or grader packaging can work.

For an independently built toolchain, build the revisions recorded in provenance, then use `tools/vendor_runtime.py`'s `vendor(root, yosys, abc, sta, share)` function to assemble binaries and their Linux dependencies in a new checkout without an existing `linux-x86_64` runtime directory. Review the resulting runtime inventory and refresh the trusted asset manifest. This creates a new explicitly identified toolchain; different native builds must not be silently mixed in an experiment.

## Safe maintenance checks

```bash
python -m compileall -q chipevo grading tests tools
python -m unittest discover -s tests
python -m chipevo study-plan --config configs/studies/example.json
```

The example endpoint and model name are placeholders. Planning validates configuration structure and prints the experiment matrix without contacting a provider or running EDA. Unit tests do not qualify real designs. Native synthetic tests are opt-in; see their environment guards in `tests/`.

## Configure a provider

Copy `configs/studies/example.json` to an ignored `*.local.json` file. Set the provider's actual endpoint, exact model ID, documented context size and supported request options. Supported protocols are `openai_chat`, `openai_responses`, and `anthropic_messages`.

```bash
cp configs/studies/example.json configs/studies/run.local.json
# Edit run.local.json before continuing.
read -rsp 'API key: ' CHIPEVO_API_KEY; echo
export CHIPEVO_API_KEY
python -m chipevo study-plan --config configs/studies/run.local.json
```

Credentials are read from the environment named by `api_key_env`. Do not put keys into JSON or commit shell configuration. A `high` request has provider-specific semantics; check that the selected service supports it. Set a supported output limit instead of assuming every endpoint accepts the example's 128,000-token maximum.

The example plans one timing round, five candidates per design and at most five concurrent requests per model. API queue waiting is excluded from the candidate's active-time budget. Summary/progress state records current RTL versions and distinguishes authoritative file state from advisory summaries. Context handling, tool counts and provider usage are recorded for later inspection.

## Explicit execution

The following command incurs model usage and runs EDA. Use a new output directory for an independent experiment:

```bash
python -m chipevo study-run \
  --config configs/studies/run.local.json \
  --output artifacts/studies/my-first-round \
  --run-model --run-eda
```

The configuration determines rounds, candidate count and model/target coverage. Check `study-plan` first. To avoid a terminal disconnect stopping a run, launch the command using your service manager or a persistent terminal such as tmux. This repository does not auto-start experiments during installation.

```bash
python -m chipevo study-report --output artifacts/studies/my-first-round
```

Checkpoint-aware continuation is implemented in the agent loop, but is not a promise that any arbitrary interrupted study directory can be relaunched safely. Preserve candidate identity, RTL, context and remaining active budget when using a resume caller; use a new directory for an independent run.

## Evaluate existing RTL

```bash
python -m chipevo evaluate \
  --design zipcpu --objective timing \
  --candidate /absolute/path/to/candidate/rtl \
  --output artifacts/runs/manual-check --run-eda
```

Only allowlisted RTL files are editable. Interfaces, clocks/resets, memory semantics and cycle behavior remain fixed. The conservative formal contract can reject unsupported hierarchy/state transformations. An unsuccessful proof is a failed validation, not automatically a functional counterexample.

For timing, the reported delay is target period minus the worst ordinary same-clock setup slack. It is a whole-design, synthesis-stage timing metric, not routed silicon frequency. Hold and special-path constraints are checked separately. For area, the objective is mapped area under the configured timing constraint. Scoring requires policy/equivalence/feasibility checks; improvement is normalized against the configured full-score improvement and includes the secondary-objective factor. The task JSON is authoritative.

## Platform packaging

After native tools and trusted assets are verified:

```bash
python -m chipevo package-grader --output dist/chipevo_grader.tar.gz
python -m chipevo package-deployment --output dist/ChipEvo-deployment.tar.gz
python tools/prepare_platform_upload.py --help
```

The platform work area contains candidate RTL and the task input. The trusted grading upload contains the evaluator, reference RTL, libraries and runtime. Graders import trusted code from `/test_files`; `/workspace` supplies candidate RTL. The output contract is `/eval/code_result.json` with exactly `resolved`, `score`, and `reason`.

Changes to evaluator code or trusted configuration require a reviewed manifest refresh before producing a new grader:

```bash
python tools/freeze_assets.py --update
```

Do not refresh the manifest merely to bypass an integrity failure. Keep deployment versions and evaluator inputs consistent within a comparison.

## Scope and attribution

This is a source release of the repaired research framework. Historical experiments are intentionally not included. Existing baseline localization data is supplied as task input; use newly measured evidence when changing the reference or toolchain. Native EDA validation is separate from synthetic unit-test success.

Benchmarks originate from [ZipCPU](https://github.com/ZipCPU/zipcpu), [Gemmini](https://github.com/ucb-bar/gemmini), [VectorCGRA](https://github.com/tancheng/VectorCGRA), [FEATHER](https://github.com/maeri-project/FEATHER), and [NVDLA](https://github.com/nvdla/hw). Native tools are [Yosys](https://github.com/YosysHQ/yosys) and [OpenSTA](https://github.com/The-OpenROAD-Project/OpenSTA). Consult the bundled third-party notices before redistribution; this README does not replace their licenses.
