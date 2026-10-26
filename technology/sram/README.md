# Fixed SRAM mapping: qualification in progress

**NOT ENABLED for scoring. No new macro PPA baseline is claimed.**

## Actual toolchain

- VLSIDA OpenRAM v1.2.49, upstream commit b2b069ce119d1488cbe6883b2240bceb5c7ce29a (archive SHA in qualification.json).
- Official Docker image pinned by docker-digests.json. Compiler source is upstream PLUS the recorded openram-bbox-performance.patch.
- OpenRAM-bundled FreePDK45, TT / 1.1 V / 25 C, aligned with the existing Nangate45 standard-cell library's nominal voltage and temperature.
- ngspice simulation-based characterization (`analytical_delay=False`). No fabricated area/delay values, FakeRAM substitution, PEX, DRC/LVS signoff or chip-level placement/routing.
- The local performance patch skips a get_bbox call ONLY when both consumers (perimeter-pin routing and supply routing) are disabled. It changes no geometry or characterization formula. Earlier exploratory pin-label parser changes were reverted.

## Current candidate

- 256x32 1RW and 256x32 1R1W macros, byte write masks.
- Gemmini scratchpad: each 4096x128 memory uses 16 depth banks x 4 width slices; 4 memories => 256 macros.
- Gemmini accumulator: each 512x512 memory uses 2 depth banks x 16 width slices; 2 memories => 64 macros.
- Total logical capacity remains 320 KiB.
- `gemmini_wrappers.candidate.v` is evaluator-owned and NOT yet connected to synthesis.
- Original RTL memory files are hash-locked in Gemmini manifest.json and checked by its synthesis and equivalence entry points. No design RTL was changed.

## Verified so far

- Original Gemmini binary rechecked: 14/14 directed tests pass.
- 256x32 wrapper: 20,850 valid output comparisons pass in Icarus, using original memory RTL as oracle. This covers full initialization/readback, bank boundaries and randomized byte masks.
- 256x32 functional-model integration: 14/14 Gemmini tests pass in both isolated uncached normal and AddressSanitizer builds. A cached build crashed during Verilator runtime initialization; cause not conclusively attributed, so the validation runner explicitly disables compiler caching and fixes worker count to one.
- These models come from OpenRAM's Verilog writer via generate-model-preview.py. They MUST match final compiler-generated models before admission.
- Tests use the common-clock operating configuration and sample completed reads after the falling edge. Upstream TwoPortSyncMem forbids same-address simultaneous read/write. Tests are NOT a full formal equivalence proof.
- Separate 16x8 tool probes generated SPICE-derived Liberty successfully readable by OpenSTA. The dual-port probe's launcher timed out despite final artifacts being emitted; this is recorded, not called a clean launcher PASS. Small probe results are not production macro results.

## Outstanding and failed trials

- Both 256x32 production characterizations are running in tmux: chipevo-openram-small-single and chipevo-openram-small-dual. Logs are under ../../gemmini/build/openram/.
- 512x128 1R1W hit ngspice N_GLOBAL_NODES overflow. The 512x128 1RW run was stopped for excessive simulation time. Neither is qualified; the old wrapper is retained as .512x128.unqualified.v for traceability.
- No Gemmini manifest sram_mapping profile is enabled. Its scripts/flow.py now supports opt-in hash-checked macro libraries and wrappers, but refuses a profile without admission status.
- Completion still requires final model/library checks, macro synthesis, instance/area accounting and STA checks. All LLM trials must use the same final frozen profile.

## Other designs

- NVDLA contains dedicated RAM wrappers and models with bit masks, clocking, clamp/power interfaces; no macro replacement has been asserted as valid. nvdla-ram-leaves.json records reachable model leaves for follow-up.
- FEATHER's instantiated sram_bank_sp configurations have 2-bit addresses and asynchronously clear their storage. Retain them as register storage unless a separate equivalent initialization wrapper is verified; ordinary SRAM is not a direct replacement.
- CGRA's shallow queues/register files and ZipCPU's architectural register file are not automatically converted into SRAM.
- Inventories explicitly distinguish lexical arrays from elaborated instances. Arrays lowered during proc may disappear from the memory list without being removed from hardware.

## Synthesis and SDC locations

For each design (gemmini, nvdla, zipcpu, cgra, feather), relative to chips/:
- <design>/scripts/flow.py: actual synthesis/STA generator and launcher.
- <design>/build/synth.ys and build/sta.tcl: generated scripts from the latest run.
- <design>/constraints/benchmark.sdc: existing pre-layout constraints; preliminary, not yet calibrated.

SDC exists before physical design. Current ABC target comes from --period, while OpenSTA reads benchmark.sdc; both must agree for a frozen experiment. Clock/IO/load calibration remains deferred by user request.

## Active continuation
The one-shot tmux session `chipevo-sram-finish` owns final characterization waits and guarded mapping/synthesis/STA. Containers: `chipevo-sram_1rw_256x32`, `chipevo-sram_1r1w_256x32`. Authoritative progress: `gemmini/build/openram/mapping-pipeline.status.json`. Earlier launcher-session names are historical.
