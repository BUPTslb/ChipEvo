# Baseline setup, 10ns. Freeze after baseline calibration, before model comparison.
create_clock -name clock -period 10 [get_ports clock]
set_clock_uncertainty 0.1 [all_clocks]
set data_inputs {}
foreach p [all_inputs] { if {[lsearch -exact [get_ports {clock}] $p] < 0} {lappend data_inputs $p} }
set_input_delay -max 1 -clock clock $data_inputs
set_input_delay -min 0.1 -clock clock $data_inputs
set_output_delay -max 1 -clock clock [all_outputs]
set_output_delay -min 0.1 -clock clock [all_outputs]
set_load 0.01 [all_outputs]
set_input_transition 0.1 [all_inputs]
set_case_analysis 0 [get_ports reset]
