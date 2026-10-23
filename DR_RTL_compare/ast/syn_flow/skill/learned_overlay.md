# Runtime learned skills (group-relative)

Updated: 2026-06-14T14:40:03

## High / medium confidence

### uut_master/clock_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.999
- **SEC rate**: 1/1

### encrypt_decrypt
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.994
- **SEC rate**: 1/1

### ast_subtree
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.977
- **SEC rate**: 1/1

### iv
- **Strategy**: late_mux_select
- **Confidence**: medium
- **Mean A_i**: 1.868
- **SEC rate**: 1/1

### branch_cond
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.803
- **SEC rate**: 2/2

### iv[3]
- **Strategy**: late_mux_select
- **Confidence**: medium
- **Mean A_i**: 1.732
- **SEC rate**: 1/1

### pRegIn
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.732
- **SEC rate**: 1/1

### rd_count_en, bypass_rk
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.732
- **SEC rate**: 1/1

### miso
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.730
- **SEC rate**: 1/1

### data_in, miso
- **Strategy**: condition_precompute_and_mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.728
- **SEC rate**: 1/1

### next_state
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.720
- **SEC rate**: 1/1

### write_uut/wbin
- **Strategy**: register_gray_and_full_to_decouple_pointer_paths
- **Confidence**: medium
- **Mean A_i**: 1.717
- **SEC rate**: 1/1

### uut_rx_block/count
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.716
- **SEC rate**: 1/1

### bit_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.714
- **SEC rate**: 1/1

### wgraycmp
- **Strategy**: tree_balance
- **Confidence**: medium
- **Mean A_i**: 1.709
- **SEC rate**: 1/1

### done_condition
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.690
- **SEC rate**: 1/1

### sck
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.689
- **SEC rate**: 1/1

### wbinnext
- **Strategy**: carry_select_adder
- **Confidence**: medium
- **Mean A_i**: 1.667
- **SEC rate**: 1/1

### bill
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.665
- **SEC rate**: 1/1

### NextState
- **Strategy**: condition_precompute_and_mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.617
- **SEC rate**: 1/1

### alu_result
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.582
- **SEC rate**: 1/1

### step_key
- **Strategy**: tree_balancing
- **Confidence**: medium
- **Mean A_i**: 1.578
- **SEC rate**: 1/1

### count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.511
- **SEC rate**: 1/1

### write_uut/full
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.484
- **SEC rate**: 1/1

### data_out
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.464
- **SEC rate**: 2/2

### col_sel
- **Strategy**: condition_precompute
- **Confidence**: high
- **Mean A_i**: 1.448
- **SEC rate**: 4/4

### sel, done, count>=bit_count
- **Strategy**: input_registration_mux_restructure_register_duplication
- **Confidence**: medium
- **Mean A_i**: 1.440
- **SEC rate**: 1/1

### Z, X
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.414
- **SEC rate**: 1/1

### o_data (via gf16_mul p/q CSE + isomorphic map CSE)
- **Strategy**: common_subexpression_elimination
- **Confidence**: medium
- **Mean A_i**: 1.414
- **SEC rate**: 1/1

### iv
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.411
- **SEC rate**: 1/1

### spi_slave/next_state
- **Strategy**: condition_precompute_and_mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.409
- **SEC rate**: 1/1

### dataOut
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.400
- **SEC rate**: 1/1

### clk_en
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.387
- **SEC rate**: 1/1

### RconXor
- **Strategy**: wire_decomposition
- **Confidence**: medium
- **Mean A_i**: 1.336
- **SEC rate**: 2/2

### ast_subtree
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.270
- **SEC rate**: 2/2

### current_state+sck+data_save
- **Strategy**: condition_precompute_and_mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.262
- **SEC rate**: 1/1

### NextState
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 1.234
- **SEC rate**: 1/1

### NextState
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: high
- **Mean A_i**: 1.224
- **SEC rate**: 4/4

### next_state
- **Strategy**: condition_precompute
- **Confidence**: high
- **Mean A_i**: 1.218
- **SEC rate**: 6/6

### cr
- **Strategy**: condition_precompute
- **Confidence**: high
- **Mean A_i**: 1.179
- **SEC rate**: 3/3

### ast_subtree
- **Strategy**: unknown
- **Confidence**: high
- **Mean A_i**: 1.137
- **SEC rate**: 4/4

### done_condition
- **Strategy**: tree_balancing
- **Confidence**: medium
- **Mean A_i**: 1.046
- **SEC rate**: 1/1

### uut_master/data_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.031
- **SEC rate**: 1/1

### rs_data, rd_data
- **Strategy**: direct_indexing
- **Confidence**: medium
- **Mean A_i**: 1.018
- **SEC rate**: 1/1

### data_save, next_state, miso, data_out, command_save, address_save
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.012
- **SEC rate**: 1/1

### wren+rden
- **Strategy**: ['condition_precompute', 'mux_tree_restructure']
- **Confidence**: medium
- **Mean A_i**: 1.002
- **SEC rate**: 1/1

### gf16_mul[3:0]
- **Strategy**: common_subexpression_elimination
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### bypass_rk_n_pipe,bypass_key_en_n_pipe,col_in
- **Strategy**: register_duplication,tree_balancing
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### pRegIn
- **Strategy**: logic_tree_balance
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### sr+dcnt
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### wb_dat_o
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### baud_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 1.000
- **SEC rate**: 1/1

### state
- **Strategy**: condition_precompute
- **Confidence**: high
- **Mean A_i**: 1.000
- **SEC rate**: 3/3

### opcode
- **Strategy**: one_hot_pre_decode
- **Confidence**: medium
- **Mean A_i**: 0.999
- **SEC rate**: 1/1

### lower_sub_result
- **Strategy**: carry_select_style_subtraction
- **Confidence**: medium
- **Mean A_i**: 0.999
- **SEC rate**: 2/2

### f0
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.998
- **SEC rate**: 1/1

### NextState
- **Strategy**: late_mux_select
- **Confidence**: medium
- **Mean A_i**: 0.990
- **SEC rate**: 1/1

### reg_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.988
- **SEC rate**: 1/1

### NextState
- **Strategy**: parallel_evaluation_with_balanced_mux
- **Confidence**: medium
- **Mean A_i**: 0.987
- **SEC rate**: 2/2

### branch_cond,alu_result
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.981
- **SEC rate**: 1/1

### update_condition
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.967
- **SEC rate**: 1/1

### next_state
- **Strategy**: one_hot_fsm_parallel_and_or
- **Confidence**: medium
- **Mean A_i**: 0.959
- **SEC rate**: 1/1

### NextState
- **Strategy**: one_hot_fsm_parallel_and_or
- **Confidence**: medium
- **Mean A_i**: 0.959
- **SEC rate**: 1/1

### flush_uut/f0
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.866
- **SEC rate**: 1/1

### NextState, ready, bill, dispense, return_sig
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 0.835
- **SEC rate**: 1/1

### carryInReg/data
- **Strategy**: wire_decomposition
- **Confidence**: medium
- **Mean A_i**: 0.819
- **SEC rate**: 1/1

### write_uut/next_state
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.789
- **SEC rate**: 1/1

### lower_sub_result
- **Strategy**: carry_select_style_decrement
- **Confidence**: medium
- **Mean A_i**: 0.752
- **SEC rate**: 1/1

### expanded_key_ff
- **Strategy**: common_subexpression
- **Confidence**: medium
- **Mean A_i**: 0.707
- **SEC rate**: 1/1

### irq_flag
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.707
- **SEC rate**: 1/1

### Z+X
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.698
- **SEC rate**: 2/2

### uut_tx_block/reg_count
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.693
- **SEC rate**: 1/1

### data_reg
- **Strategy**: late_mux_select
- **Confidence**: medium
- **Mean A_i**: 0.673
- **SEC rate**: 1/1

### PC
- **Strategy**: condition_precompute
- **Confidence**: high
- **Mean A_i**: 0.634
- **SEC rate**: 6/6

### PC
- **Strategy**: late_mux_select
- **Confidence**: medium
- **Mean A_i**: 0.593
- **SEC rate**: 1/1

### b1Reg/data
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 0.577
- **SEC rate**: 1/1

### a1Reg/data
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.577
- **SEC rate**: 1/1

### write_uut/wren
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.577
- **SEC rate**: 1/1

### wbin
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.577
- **SEC rate**: 1/1

### w0
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 0.577
- **SEC rate**: 1/1

### uut_rx_block/done
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.570
- **SEC rate**: 1/1

### data_count_plus1
- **Strategy**: carry_select_adder
- **Confidence**: medium
- **Mean A_i**: 0.553
- **SEC rate**: 1/1

### alu_result
- **Strategy**: mux_tree_restructure
- **Confidence**: high
- **Mean A_i**: 0.552
- **SEC rate**: 3/3

### data_out
- **Strategy**: condition_precompute_and_mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 0.484
- **SEC rate**: 1/1

### data_count_in_data_and_gt_32
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.484
- **SEC rate**: 1/1

### uut_slave/current_state
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.478
- **SEC rate**: 1/1

### temp_reg_count
- **Strategy**: tree_balancing
- **Confidence**: medium
- **Mean A_i**: 0.470
- **SEC rate**: 1/1

### done
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.466
- **SEC rate**: 2/2

### full_val+empty_val
- **Strategy**: ['condition_precompute', 'condition_precompute']
- **Confidence**: medium
- **Mean A_i**: 0.427
- **SEC rate**: 1/1

### State
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.400
- **SEC rate**: 1/1

### PC
- **Strategy**: mux_tree_restructure
- **Confidence**: medium
- **Mean A_i**: 0.353
- **SEC rate**: 1/1

### wbincmp
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.348
- **SEC rate**: 1/1

### wren
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.347
- **SEC rate**: 1/1

### sck
- **Strategy**: mux_before_adder_one_hot_pre_decode_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.322
- **SEC rate**: 1/1

### xor_input_bkp_iv
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.224
- **SEC rate**: 1/1

### step_key
- **Strategy**: logic_tree_balance_gf
- **Confidence**: medium
- **Mean A_i**: 0.146
- **SEC rate**: 1/1

### IR, ALU_OUT, zero_flag, regis, PC
- **Strategy**: condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.116
- **SEC rate**: 1/1

### bit_count
- **Strategy**: carry_select_style_decrement
- **Confidence**: medium
- **Mean A_i**: 0.116
- **SEC rate**: 1/1

### state_is_rdy+state_is_disp+state_is_rtn+state_is_bill10+state_is_bill20+state_is_bill30
- **Strategy**: direct_indexing_for_one_hot
- **Confidence**: medium
- **Mean A_i**: 0.068
- **SEC rate**: 1/1

### State bits
- **Strategy**: direct_indexing_for_one_hot
- **Confidence**: medium
- **Mean A_i**: 0.054
- **SEC rate**: 1/1

### alu_result
- **Strategy**: mux_tree_restructure_condition_precompute
- **Confidence**: medium
- **Mean A_i**: 0.017
- **SEC rate**: 1/1

## Anti-patterns (avoid)

- condition_precompute on State (ticket_machine v1.1)
- none on State (ticket_machine v1.3)
- condition_precompute on State (ticket_machine v2.1)
- mux_tree_restructure on State (ticket_machine v2.3)
- condition_precompute on State (ticket_machine v3.3)
- condition_precompute on NextState (ticket_machine v5.1)
- one_hot_case_mux_restructure on NextState (ticket_machine v5.2)
- condition_precompute on State (ticket_machine v5.3)
- mux_tree_restructure_condition_precompute on NextState (ticket_machine v6.2)
- condition_precompute on State (ticket_machine v7.1)
- condition_precompute on State (ticket_machine v7.3)
- tree_balance on State (ticket_machine v8.1)
- register_duplication on State (ticket_machine v8.3)
- condition_precompute on State (ticket_machine v9.1)
- condition_precompute on baud_count+next_state+next_state+count_16+count_8 (UART v0.5)
