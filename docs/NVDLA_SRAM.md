# NVDLA macro reference v1

The active `designs/nvdla/rtl` and `reference` are a NEW NVDLA-derived reference.
Equivalence to the previous NVIDIA RAM implementation is not an admission gate.
Subsequent LLM candidates must preserve this revision's functionality and cycles.

## Fixed storage

- 36 explicit nv_ram wrapper types use synchronous evaluator-owned adapters.
- Mapped netlist: 214 OpenRAM 256x32 1R1W macros and one dedicated 80x17 macro.
- Physical macros: OpenRAM v1.2.49 commit b2b069ce119d1488cbe6883b2240bceb5c7ce29a,
  FreePDK45, ngspice TT/1.1V/25C characterization. No invented Liberty numbers.
- Actual Liberty/Verilog/LEF/GDS and the small-macro configuration/patch are under
  `technology/sram/nvdla-reference-v1/`. Macro padding is included in area.
- Requests are sampled on rising edges; macro reads/writes complete on falling
  edges. Explicit forwarding defines same-address new-data behavior. Disabled
  reads explicitly retain the last valid result. `p` wrappers keep an additional
  rising-edge `ore`-enabled output register. `hp` retains the bypass input.
- Logical capacity and ports are retained. Low nine power-control bits disable
  updates; physical low-power/test behavior is outside this benchmark contract.
- Shallow inline FIFO registers remain registers. Unused old RAM models and
  *_logic files have been removed from the active trees and preserved in archive.
- RAM wrappers, macro functional contracts and implementation assets are fixed.
  Formal grading uses the frozen functional contracts, checked against original
  OpenRAM models at valid observation points. Synthesis/STA uses characterized
  Liberty cells, never synthesized behavioral arrays for these explicit RAMs.

## Qualification

- 36 storage shapes, 75,083 defined comparisons: PASS.
- All 357 reachable module definitions: self equivalence PASS.
- Equivalent/non-equivalent native proof controls: accepted/rejected respectively.
- Upstream SDP, PDP, CDP and small convolution traces: PASS, original CRCs.
- Rebuild Verilator with compiler cache disabled; the cached build exhibited an
  eval_static startup crash. The uncached build and all four traces passed.
- Both area and timing synthesis recipes and OpenSTA completed with 215 macros.

| Task | Fixed period | Baseline setup slack | Baseline total area (um2) |
|---|---:|---:|---:|
| area | 5 ns / 200 MHz | 0.915329 ns | 7825283.451250 |
| timing | 0.1 ns / 10,000 MHz | -2.541857 ns | 7825255.255250 |

Area uses the area-priority ABC recipe; timing uses the fixed aggressive delay
recipe. Compare a candidate with its baseline under the SAME recipe and target.
10,000 MHz is optimization pressure, not an achieved frequency.

This is logic synthesis / pre-layout STA, not physical signoff. Existing hold
slack is -0.159140 ns; electrical/reset distribution reports
are preserved. No routed parasitics, clock tree, or hold/electrical closure is claimed.

## Entry points

```
python tools/doctor.py
python designs/nvdla/model/run.py --run-eda --output artifacts/my-nvdla-regression
python -m chipevo evaluate --design nvdla --objective area --candidate designs/nvdla/rtl --output artifacts/my-nvdla-area --run-eda
```

Functional regression additionally requires Verilator, make and a C++20 compiler.
Native Yosys/ABC/OpenSTA for grading are vendored; Python dependencies are pinned
in requirements.txt. Optional regression is not needed to run formal/native grading.

Current qualification: `reports/nvdla-macro-reference-v1-20261024.json` and
`technology/sram/nvdla-reference-v1/qualification.json`.
Previous revision: `archive/reference-revisions/nvdla-before-macro-reference-v1-20261024`.
No LLM calls or rollout experiments were launched for this baseline preparation.
