# Macro reference v1: default area period; evaluator renders the fixed objective period.
create_clock -name dla_core_clk -period 5 [get_ports dla_core_clk]
create_clock -name dla_csb_clk -period 5 [get_ports dla_csb_clk]
set_clock_uncertainty 0.1 [all_clocks]
set data_inputs {}
foreach p [all_inputs] { if {[lsearch -exact [get_ports {dla_core_clk dla_csb_clk}] $p] < 0} {lappend data_inputs $p} }
set_input_delay -max 1 -clock dla_core_clk $data_inputs
set_input_delay -min 0.1 -clock dla_core_clk $data_inputs
set_output_delay -max 1 -clock dla_core_clk [all_outputs]
set_output_delay -min 0.1 -clock dla_core_clk [all_outputs]
set_load 0.01 [all_outputs]
set_input_transition 0.1 [all_inputs]
set_case_analysis 1 [get_ports dla_reset_rstn]
set_case_analysis 1 [get_ports direct_reset_]

# Normal-operation mode, matching frozen tb/upstream/nvdla.cpp lines 960-968.
set_case_analysis 0 [get_ports global_clk_ovr_on]
set_case_analysis 0 [get_ports tmc2slcg_disable_clock_gating]
set_case_analysis 0 [get_ports test_mode]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_c_pd[*]}]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_ma_pd[*]}]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_mb_pd[*]}]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_p_pd[*]}]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_o_pd[*]}]
set_case_analysis 0 [get_ports {nvdla_pwrbus_ram_a_pd[*]}]

# Post-reset steady operation: reset synchronization has completed.
# No clock period or IO budget change. Reset assertion/release is not this STA mode.
set_case_analysis 1 [get_pins {u_partition_a/u_partition_a_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_c/u_partition_c_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_ma/u_partition_m_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_mb/u_partition_m_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_o/u_sync_core_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_o/u_sync_falcon_reset/synced_rstn}]
set_case_analysis 1 [get_pins {u_partition_p/u_partition_p_reset/synced_rstn}]
