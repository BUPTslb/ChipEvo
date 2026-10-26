The frozen reference/ RTL is the cycle-accurate behavioral oracle for optimization.
Verilator compiles this RTL into a C++ simulator. It is not an independent architectural
model and does not establish original design correctness. See tb/ and NOTES.md for
workload coverage. The idle smoke test only tests reset/elaboration/execution.
