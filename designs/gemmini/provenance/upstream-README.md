## Current editable RTL entry (supersedes the older two-version instructions)

The authoritative optimization source is designs/gemmini-standalone/rtl/:
136 Verilog files, one module per file, and files.f shared by simulation and synthesis.
This includes an unused plusarg_reader support module. Do not compile historical
generated/rtl copies alongside these files.

Edit these files directly, then run:
    make test-rtl
    make synth-mapped

test-verilog and synth-verilog-mapped are aliases for the same paths.
Neither test nor synthesis regenerates or overwrites editable RTL.
make generate / make verilog only rebuild historical generator intermediates;
they do NOT update the editable optimization source.
Simulation diagnostics are retained with synopsys translate_off/on comments.
The six main SRAM models are used in simulation and blackboxed during mapping;
memory behavior must remain frozen for fair optimization unless separately verified.
Test results hash every editable .v file and the testbench/golden model.

14 regression cases are a smoke/regression gate, NOT proof of equivalence.
Use a frozen baseline and sequential equivalence for cycle-preserving changes;
for latency-changing transformations, use protocol/transaction-level comparison
and broader functional testing. Neither formal gate has been implemented here.
Do not permit agents to modify the golden model, testbench, scoring rules or
verification assumptions to make their RTL pass.

---

# Standalone Gemmini (no CPU)

This package instantiates the complete upstream Gemmini accelerator, not just
Mesh/MeshWithDelays. Rocket-Chip is a Scala/interface dependency only: no Rocket,
BOOM, CPU cache, SoC, instruction-fetch or instruction-decoder core is instantiated.

## Frozen design

- Gemmini: 8c3f9923a44a2fe2c7930587be297d6d4f8c09ca
- Chipyard dependency manifest: e02074414158c85059c1dcb231ff2f8941254b9a
- Chisel 6.5.0, Scala 2.13.12, sbt 1.8.2, Java 11.
- Upstream GemminiConfigs.defaultConfig: 16x16, INT8 inputs/weights,
  INT32 accumulators, OS+WS, 256 KiB scratchpad and 64 KiB accumulator.
- The default includes floating-point scaling circuitry; "INT8" does NOT mean
  every internal circuit is integer-only. No features were silently removed.
- Wrapper address window: 32-bit physical memory address, 128-bit TileLink,
  max transaction 64 bytes. RoCC operands are 64-bit.
- Output top: Standalone. Module boundary includes only the accelerator and
  interface/protocol logic, with the RoCC and TileLink signals exposed.
- Exact dependencies, RTL checksums, storage census: generated manifest.json.

## Commands (from this directory)

    bash scripts/setup-deps.sh
    make generate
    make model
    make test-rtl
    make synth
    make synth-mapped
    make report

Outputs: ../../generated/gemmini-standalone/
The build uses ../.. as the project root. Existing Gemmini source is not patched.
Source generation runs in this directory and writes its own gemmini_params.h,
not the upstream software's header. The generated copy is also saved in outputs.

## Deliverables

- src/main/scala/Standalone.scala: CPU-free generator wrapper.
- build.sbt: minimal dependency build; does not build the Chipyard SoC project.
- rtl/split/Standalone.sv + plusarg_reader.v: synthesizable RTL and resource.
- rtl/files.f: simulation/synthesis file list.
- model/golden.hpp: independent mathematical INT8 GEMM reference with INT32
  modulo accumulation and identity-scale saturated INT8 output.
- golden-matmul: stdin 256 A values then 256 B values, stdout 256 INT32 results.
  This is an operation-level reference, NOT a complete instruction or timing model.
- tb/main.cpp: command driver, TileLink memory responder and reference comparisons.
- synth/generic.{json,v}: generic logic, all memories retained as memory objects.
- synth/mapped.{json,v}: Nangate45 logic mapping with six large memory interfaces.
- logs/: real generation, simulation and synthesis logs.

## Verification boundary

The testbench has no CPU. It sends RoCC commands directly and serves DMA through
a 1 MiB byte-addressed memory model. Tests run with machine privilege and bare
physical addressing. Virtual-memory hardware remains in RTL, but VM/PTW, page
faults and privilege transitions are NOT verified. Unexpected PTW or CPU-cache
requests fail the test, rather than being silently acknowledged.

Tests exercise A-channel backpressure, data movement, partial 7x13 byte-mask
transfers across all four scratchpad banks, OS matrix multiplication,
WS INT32 outputs on both accumulator banks, signed input extremes and two K tiles accumulating into SRAM
(K=32). Four deterministic WS datasets are used. Hardware assertions are enabled.

Not yet covered: general convolution instructions, nonlinear activations, non-unit
floating-point scales, all transpose combinations, full random protocol stress,
all ISA modes, gate-level simulation or formal equivalence. Passing these tests
does not constitute complete Gemmini certification.

The default upstream elaboration has 26 dynamic-index width warnings. They are
logged and not "fixed" by changing the design. Verilator uses -Wno-fatal so warning
presence does not prevent running; assertions and test mismatches remain fatal.

## SRAM boundary (important)

1. mem_4096x128: 4 instances, 1RW synchronous read, 16 byte-write enables:
   256 KiB total scratchpad.
2. mem_512x512: 2 instances, independent R/W ports, 64 byte-write enables:
   64 KiB total accumulator.

Both models are the unmodified generated RTL, with no memory reset.
Do not promise defined same-address read/write collision behavior beyond the
upstream specification; a future physical macro mapping must resolve it.

synth-mapped.sh blackboxes ONLY these two exact module types via the slang
frontend. This preserves their ports and instances while mapping logic and small
queues to standard cells. Functional simulation always uses the actual memory
models. These blackboxes are memory INTERFACE boundaries, not fabricated SRAM IP.

Physical macro mapping is NOT complete. Exact compatible Liberty/LEF/GDS views
have not been qualified. Area from the mapped logic excludes SRAM. Do not admit
this netlist to a physical-quality score or claim a completed 3D run yet.
The next stage must provide or compose matching 1RW/1R1W, byte-masked macros and
re-run tests after mapping. Never replace the accumulator with a single-port RAM.

## Synthesis

Uses project Yosys 0.61 + slang, not /usr/bin/yosys 0.9.
The mapped flow defaults to the unscaled Nangate45 typical Liberty.
LIBERTY and YOSYS may be explicitly overridden; record changes as a new run.
Mapped synthesis preserves RTL hierarchy and loads standard-cell port definitions
before structural checking. Verification assertions are removed only in synthesis;
RTL simulation keeps assertions enabled. ABC uses -fast for a reproducible bring-up mapping (not a QoR-optimized baseline).
A pre-ABC RTLIL checkpoint is saved for remapping. SAT resource-sharing is disabled (-noshare) to avoid expensive cross-PE searches.
No timing target is assumed. No WNS/TNS, timing closure or placement claim is made.
An SDC template requires the caller to supply clock and IO delays.

## Dependencies and licenses

Chipyard is checked out separately in external/gemmini-chipyard at the commit
specified by Gemmini's CHIPYARD.hash. Only rocket-chip, hardfloat, diplomacy and cde
submodules are initialized. external/gemmini-targetutils is a sparse checkout of
the matching FireSim commit, containing the annotation library only.
gemmini-rocc-tests is initialized at its pinned revision for ISA reference;
no RISC-V toolchain, CPU simulation, Linux or ONNX dependency was built.
Upstream licenses remain in their original repositories. The generated hardware
inherits its upstream licensing; this package does not relicense upstream code.

## Pure Verilog backend entry (2026-10-23)

Run from this adapter directory:

    make verilog
    make test-verilog
    make synth-verilog-mapped

The generator still emits SystemVerilog as an intermediate. sv2v v0.0.10 converts
the complete RTL into generated/gemmini-standalone/rtl/verilog/:
- Standalone.v: simulation version, with upstream diagnostic system tasks.
- Standalone.synth.v: synthesis version, converted with SYNTHESIS defined.
- files.f: simulation file list; do not load both versions together.
- SHA256SUMS: hashes of converted outputs.

The synthesis version passed Yosys read_verilog (without -sv or slang) and
hierarchy -check. All 14 existing CPU-free test cases passed on Standalone.v.
The simulation version retains diagnostic tasks such as $error; some strict
Verilog-2005 simulators may not implement those tasks. Tested with Verilator.
The mapped synthesis script uses the native Verilog frontend, preserves the
same six SRAM interfaces, and writes to synth-verilog/, separate from earlier
slang results. Full technology mapping of this new entry has NOT been rerun.
Existing mapped QoR therefore refers to the earlier slang run.
No CPU was introduced. Physical SRAM qualification is still outstanding.
