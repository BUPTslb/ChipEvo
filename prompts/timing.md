Optimize the RTL timing of the existing {{design}} design. Use English for all explanations,
summaries, and new RTL comments. Do not use Chinese.

Modify only non-storage logic permitted by policy.json under designs/{{design}}/rtl/.
Preserve interfaces, parameters, reset behavior, state correspondence, and cycle behavior.
Memory implementation, capacity, ports, read/write masks, initialization, and read/write
latency are fixed. Clock, CDC, and reset synchronizers are fixed.
Do not modify reference RTL, configurations, synthesis/grading scripts, libraries, or tools.
Do not add pipeline cycles or change output latency. Preserve the file list, module set,
and submodule instance set. You may rewrite logic within any number of permitted files
or modules. The current proof contract requires state correspondence and does not support
hierarchy changes through new modules or state re-encoding.

Minimize D under the fixed SDC while keeping total area at or below 1.05 times the initial
baseline area. D = the fixed clock period minus the worst ordinary same-clock setup slack.
Continue seeking lower D even when slack is positive; meeting {{period_ns}} ns alone does
not complete the optimization. Do not worsen hold or special timing checks.
An improvement of at least 2% in the primary metric is required for resolved=true.
The continuous score clips improvement / 10% and applies an area-increase penalty.

Inspect the supplied manifest, policy, module index, and localization context. A module
definition may have multiple instances; a change affects all instances. Read source,
dependencies, and instantiation sites as needed, then submit actual RTL file changes.
There is no default two-file or 200-line edit limit. Never fabricate reports or metrics.

EDA feedback allowance: {{eda_feedback_budget}}. If it is zero, do not run synthesis,
STA, or proofs; independent code grading performs the evaluation. Do not call external
LLM APIs. Finish with a concise English explanation of the changed locations and rationale.
