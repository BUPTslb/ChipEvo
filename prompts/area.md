Optimize the RTL area of the existing {{design}} design. Use English for all explanations,
summaries, and new RTL comments. Do not use Chinese.

Modify only non-storage logic permitted by policy.json under designs/{{design}}/rtl/.
Preserve interfaces, parameters, reset behavior, state correspondence, and cycle behavior.
Memory implementation, capacity, ports, read/write masks, initialization, and read/write
latency are fixed. Clock, CDC, and reset synchronizers are fixed.
Do not modify reference RTL, configurations, synthesis/grading scripts, libraries, or tools.
Do not trade additional output cycles for lower area. Preserve the file list, module set,
and submodule instance set. You may rewrite logic within any number of permitted files
or modules. The current proof contract requires state correspondence and does not support
hierarchy changes through new modules or state re-encoding.

Reduce total mapped area A while satisfying {{area_timing_contract}}.
D = the fixed clock period minus the worst ordinary same-clock setup slack.
Do not worsen hold or special timing checks. Area includes standard cells and fixed macros;
the fixed storage contribution must be retained. An area improvement of at least 2% is
required for resolved=true. The continuous score clips improvement / 10%.

Inspect the supplied manifest, policy, module index, and localization context. Prioritize
redundant combinational structures with high instance counts and large area contribution.
A change to one definition affects all its instances; preserve all legal input behaviors.
Read source and dependencies as needed, then submit actual RTL file changes. There is no
default two-file or 200-line edit limit. Never fabricate reports, remove storage, or change
the evaluation environment.

EDA feedback allowance: {{eda_feedback_budget}}. If it is zero, do not run synthesis,
STA, or proofs; independent code grading performs the evaluation. Do not call external
LLM APIs. Finish with a concise English explanation of the changed locations and rationale.
