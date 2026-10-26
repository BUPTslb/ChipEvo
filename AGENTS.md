# ChipEvo working rules

The user-authorized primary task is open-source, fixed-memory, cycle-preserving RTL
timing/area optimization. These rules replace the historical commercial-tool policy.

- Do not automatically launch LLM calls, synthesis, STA, equivalence or benchmark
  experiments while editing the framework. Run them only when explicitly requested.
- Static checks, unit tests with synthetic data, packaging, tool version/startup
  checks and reading existing results are permitted during maintenance.
- All model-facing instructions must be in English. Do not use Chinese in task
  prompts, system prompts, tool descriptions, or context summarization/recovery
  instructions. Keep this rule consistent across all tested models.
- Only `designs/<id>/rtl/` is model-editable. Reference, memory implementation,
  macro configuration, clocks/CDC/reset synchronizers, evaluator, toolchain and
  constraints are evaluator-owned. Enforce `policy.json` and complete equivalence.
- Memory capacity, ports, latency, masks, initialization and macro implementation
  stay fixed. Surrounding non-storage datapath/control logic may be optimized.
- No implicit two-file or 200-line edit limit. Such a budget must be explicitly
  defined in a future task configuration before an experiment.
- Baseline and candidate always use the same objective recipe and timing config.
  Score only top-level mapped results. Never trust candidate-provided metrics.
- Keep intermediate files in `artifacts/`, reports in `reports/`, immutable
  historic evidence in `archive/`. Do not delete old user data to tidy the project.
- Report end-to-end qualification separately for each design and objective.
  User-authorized ZipCPU smoke tests do not qualify all five designs. Historical
  qualification belongs to its old release. No further experiment is implicit.
- Native tools are Yosys/ABC/OpenSTA from pinned open-source builds, not invented
  timing models. Native runtime and asset manifests must be checked by graders.
- The standalone platform graders import code only from the trusted upload under
  `/test_files`; `/workspace` supplies RTL only. Output exactly resolved/score/reason.
