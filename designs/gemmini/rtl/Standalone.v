module Standalone (
	clock,
	reset,
	rocc_cmd_ready,
	rocc_cmd_valid,
	rocc_cmd_bits_inst_funct,
	rocc_cmd_bits_inst_rs2,
	rocc_cmd_bits_inst_rs1,
	rocc_cmd_bits_inst_xd,
	rocc_cmd_bits_inst_xs1,
	rocc_cmd_bits_inst_xs2,
	rocc_cmd_bits_inst_rd,
	rocc_cmd_bits_inst_opcode,
	rocc_cmd_bits_rs1,
	rocc_cmd_bits_rs2,
	rocc_cmd_bits_status_debug,
	rocc_cmd_bits_status_cease,
	rocc_cmd_bits_status_wfi,
	rocc_cmd_bits_status_isa,
	rocc_cmd_bits_status_dprv,
	rocc_cmd_bits_status_dv,
	rocc_cmd_bits_status_prv,
	rocc_cmd_bits_status_v,
	rocc_cmd_bits_status_sd,
	rocc_cmd_bits_status_zero2,
	rocc_cmd_bits_status_mpv,
	rocc_cmd_bits_status_gva,
	rocc_cmd_bits_status_mbe,
	rocc_cmd_bits_status_sbe,
	rocc_cmd_bits_status_sxl,
	rocc_cmd_bits_status_uxl,
	rocc_cmd_bits_status_sd_rv32,
	rocc_cmd_bits_status_zero1,
	rocc_cmd_bits_status_tsr,
	rocc_cmd_bits_status_tw,
	rocc_cmd_bits_status_tvm,
	rocc_cmd_bits_status_mxr,
	rocc_cmd_bits_status_sum,
	rocc_cmd_bits_status_mprv,
	rocc_cmd_bits_status_xs,
	rocc_cmd_bits_status_fs,
	rocc_cmd_bits_status_mpp,
	rocc_cmd_bits_status_vs,
	rocc_cmd_bits_status_spp,
	rocc_cmd_bits_status_mpie,
	rocc_cmd_bits_status_ube,
	rocc_cmd_bits_status_spie,
	rocc_cmd_bits_status_upie,
	rocc_cmd_bits_status_mie,
	rocc_cmd_bits_status_hie,
	rocc_cmd_bits_status_sie,
	rocc_cmd_bits_status_uie,
	rocc_resp_ready,
	rocc_resp_valid,
	rocc_resp_bits_rd,
	rocc_resp_bits_data,
	rocc_mem_req_ready,
	rocc_mem_req_valid,
	rocc_mem_req_bits_addr,
	rocc_mem_req_bits_tag,
	rocc_mem_req_bits_cmd,
	rocc_mem_req_bits_size,
	rocc_mem_req_bits_signed,
	rocc_mem_req_bits_dprv,
	rocc_mem_req_bits_dv,
	rocc_mem_req_bits_phys,
	rocc_mem_req_bits_no_resp,
	rocc_mem_req_bits_no_alloc,
	rocc_mem_req_bits_no_xcpt,
	rocc_mem_req_bits_data,
	rocc_mem_req_bits_mask,
	rocc_mem_s1_kill,
	rocc_mem_s1_data_data,
	rocc_mem_s1_data_mask,
	rocc_mem_s2_nack,
	rocc_mem_s2_nack_cause_raw,
	rocc_mem_s2_kill,
	rocc_mem_s2_uncached,
	rocc_mem_s2_paddr,
	rocc_mem_resp_valid,
	rocc_mem_resp_bits_addr,
	rocc_mem_resp_bits_tag,
	rocc_mem_resp_bits_cmd,
	rocc_mem_resp_bits_size,
	rocc_mem_resp_bits_signed,
	rocc_mem_resp_bits_dprv,
	rocc_mem_resp_bits_dv,
	rocc_mem_resp_bits_data,
	rocc_mem_resp_bits_mask,
	rocc_mem_resp_bits_replay,
	rocc_mem_resp_bits_has_data,
	rocc_mem_resp_bits_data_word_bypass,
	rocc_mem_resp_bits_data_raw,
	rocc_mem_resp_bits_store_data,
	rocc_mem_replay_next,
	rocc_mem_s2_xcpt_ma_ld,
	rocc_mem_s2_xcpt_ma_st,
	rocc_mem_s2_xcpt_pf_ld,
	rocc_mem_s2_xcpt_pf_st,
	rocc_mem_s2_xcpt_gf_ld,
	rocc_mem_s2_xcpt_gf_st,
	rocc_mem_s2_xcpt_ae_ld,
	rocc_mem_s2_xcpt_ae_st,
	rocc_mem_s2_gpa,
	rocc_mem_s2_gpa_is_pte,
	rocc_mem_ordered,
	rocc_mem_store_pending,
	rocc_mem_perf_acquire,
	rocc_mem_perf_release,
	rocc_mem_perf_grant,
	rocc_mem_perf_tlbMiss,
	rocc_mem_perf_blocked,
	rocc_mem_perf_canAcceptStoreThenLoad,
	rocc_mem_perf_canAcceptStoreThenRMW,
	rocc_mem_perf_canAcceptLoadThenLoad,
	rocc_mem_perf_storeBufferEmptyAfterLoad,
	rocc_mem_perf_storeBufferEmptyAfterStore,
	rocc_mem_keep_clock_enabled,
	rocc_mem_clock_enabled,
	rocc_busy,
	rocc_interrupt,
	rocc_exception,
	rocc_ptw_0_req_ready,
	rocc_ptw_0_req_valid,
	rocc_ptw_0_req_bits_valid,
	rocc_ptw_0_req_bits_bits_addr,
	rocc_ptw_0_req_bits_bits_need_gpa,
	rocc_ptw_0_req_bits_bits_vstage1,
	rocc_ptw_0_req_bits_bits_stage2,
	rocc_ptw_0_resp_valid,
	rocc_ptw_0_resp_bits_ae_ptw,
	rocc_ptw_0_resp_bits_ae_final,
	rocc_ptw_0_resp_bits_pf,
	rocc_ptw_0_resp_bits_gf,
	rocc_ptw_0_resp_bits_hr,
	rocc_ptw_0_resp_bits_hw,
	rocc_ptw_0_resp_bits_hx,
	rocc_ptw_0_resp_bits_pte_reserved_for_future,
	rocc_ptw_0_resp_bits_pte_ppn,
	rocc_ptw_0_resp_bits_pte_reserved_for_software,
	rocc_ptw_0_resp_bits_pte_d,
	rocc_ptw_0_resp_bits_pte_a,
	rocc_ptw_0_resp_bits_pte_g,
	rocc_ptw_0_resp_bits_pte_u,
	rocc_ptw_0_resp_bits_pte_x,
	rocc_ptw_0_resp_bits_pte_w,
	rocc_ptw_0_resp_bits_pte_r,
	rocc_ptw_0_resp_bits_pte_v,
	rocc_ptw_0_resp_bits_level,
	rocc_ptw_0_resp_bits_fragmented_superpage,
	rocc_ptw_0_resp_bits_homogeneous,
	rocc_ptw_0_resp_bits_gpa_valid,
	rocc_ptw_0_resp_bits_gpa_bits,
	rocc_ptw_0_resp_bits_gpa_is_pte,
	rocc_ptw_0_ptbr_mode,
	rocc_ptw_0_ptbr_asid,
	rocc_ptw_0_ptbr_ppn,
	rocc_ptw_0_hgatp_mode,
	rocc_ptw_0_hgatp_asid,
	rocc_ptw_0_hgatp_ppn,
	rocc_ptw_0_vsatp_mode,
	rocc_ptw_0_vsatp_asid,
	rocc_ptw_0_vsatp_ppn,
	rocc_ptw_0_status_debug,
	rocc_ptw_0_status_cease,
	rocc_ptw_0_status_wfi,
	rocc_ptw_0_status_isa,
	rocc_ptw_0_status_dprv,
	rocc_ptw_0_status_dv,
	rocc_ptw_0_status_prv,
	rocc_ptw_0_status_v,
	rocc_ptw_0_status_sd,
	rocc_ptw_0_status_zero2,
	rocc_ptw_0_status_mpv,
	rocc_ptw_0_status_gva,
	rocc_ptw_0_status_mbe,
	rocc_ptw_0_status_sbe,
	rocc_ptw_0_status_sxl,
	rocc_ptw_0_status_uxl,
	rocc_ptw_0_status_sd_rv32,
	rocc_ptw_0_status_zero1,
	rocc_ptw_0_status_tsr,
	rocc_ptw_0_status_tw,
	rocc_ptw_0_status_tvm,
	rocc_ptw_0_status_mxr,
	rocc_ptw_0_status_sum,
	rocc_ptw_0_status_mprv,
	rocc_ptw_0_status_xs,
	rocc_ptw_0_status_fs,
	rocc_ptw_0_status_mpp,
	rocc_ptw_0_status_vs,
	rocc_ptw_0_status_spp,
	rocc_ptw_0_status_mpie,
	rocc_ptw_0_status_ube,
	rocc_ptw_0_status_spie,
	rocc_ptw_0_status_upie,
	rocc_ptw_0_status_mie,
	rocc_ptw_0_status_hie,
	rocc_ptw_0_status_sie,
	rocc_ptw_0_status_uie,
	rocc_ptw_0_hstatus_zero6,
	rocc_ptw_0_hstatus_vsxl,
	rocc_ptw_0_hstatus_zero5,
	rocc_ptw_0_hstatus_vtsr,
	rocc_ptw_0_hstatus_vtw,
	rocc_ptw_0_hstatus_vtvm,
	rocc_ptw_0_hstatus_zero3,
	rocc_ptw_0_hstatus_vgein,
	rocc_ptw_0_hstatus_zero2,
	rocc_ptw_0_hstatus_hu,
	rocc_ptw_0_hstatus_spvp,
	rocc_ptw_0_hstatus_spv,
	rocc_ptw_0_hstatus_gva,
	rocc_ptw_0_hstatus_vsbe,
	rocc_ptw_0_hstatus_zero1,
	rocc_ptw_0_gstatus_debug,
	rocc_ptw_0_gstatus_cease,
	rocc_ptw_0_gstatus_wfi,
	rocc_ptw_0_gstatus_isa,
	rocc_ptw_0_gstatus_dprv,
	rocc_ptw_0_gstatus_dv,
	rocc_ptw_0_gstatus_prv,
	rocc_ptw_0_gstatus_v,
	rocc_ptw_0_gstatus_sd,
	rocc_ptw_0_gstatus_zero2,
	rocc_ptw_0_gstatus_mpv,
	rocc_ptw_0_gstatus_gva,
	rocc_ptw_0_gstatus_mbe,
	rocc_ptw_0_gstatus_sbe,
	rocc_ptw_0_gstatus_sxl,
	rocc_ptw_0_gstatus_uxl,
	rocc_ptw_0_gstatus_sd_rv32,
	rocc_ptw_0_gstatus_zero1,
	rocc_ptw_0_gstatus_tsr,
	rocc_ptw_0_gstatus_tw,
	rocc_ptw_0_gstatus_tvm,
	rocc_ptw_0_gstatus_mxr,
	rocc_ptw_0_gstatus_sum,
	rocc_ptw_0_gstatus_mprv,
	rocc_ptw_0_gstatus_xs,
	rocc_ptw_0_gstatus_fs,
	rocc_ptw_0_gstatus_mpp,
	rocc_ptw_0_gstatus_vs,
	rocc_ptw_0_gstatus_spp,
	rocc_ptw_0_gstatus_mpie,
	rocc_ptw_0_gstatus_ube,
	rocc_ptw_0_gstatus_spie,
	rocc_ptw_0_gstatus_upie,
	rocc_ptw_0_gstatus_mie,
	rocc_ptw_0_gstatus_hie,
	rocc_ptw_0_gstatus_sie,
	rocc_ptw_0_gstatus_uie,
	rocc_ptw_0_pmp_0_cfg_l,
	rocc_ptw_0_pmp_0_cfg_res,
	rocc_ptw_0_pmp_0_cfg_a,
	rocc_ptw_0_pmp_0_cfg_x,
	rocc_ptw_0_pmp_0_cfg_w,
	rocc_ptw_0_pmp_0_cfg_r,
	rocc_ptw_0_pmp_0_addr,
	rocc_ptw_0_pmp_0_mask,
	rocc_ptw_0_pmp_1_cfg_l,
	rocc_ptw_0_pmp_1_cfg_res,
	rocc_ptw_0_pmp_1_cfg_a,
	rocc_ptw_0_pmp_1_cfg_x,
	rocc_ptw_0_pmp_1_cfg_w,
	rocc_ptw_0_pmp_1_cfg_r,
	rocc_ptw_0_pmp_1_addr,
	rocc_ptw_0_pmp_1_mask,
	rocc_ptw_0_pmp_2_cfg_l,
	rocc_ptw_0_pmp_2_cfg_res,
	rocc_ptw_0_pmp_2_cfg_a,
	rocc_ptw_0_pmp_2_cfg_x,
	rocc_ptw_0_pmp_2_cfg_w,
	rocc_ptw_0_pmp_2_cfg_r,
	rocc_ptw_0_pmp_2_addr,
	rocc_ptw_0_pmp_2_mask,
	rocc_ptw_0_pmp_3_cfg_l,
	rocc_ptw_0_pmp_3_cfg_res,
	rocc_ptw_0_pmp_3_cfg_a,
	rocc_ptw_0_pmp_3_cfg_x,
	rocc_ptw_0_pmp_3_cfg_w,
	rocc_ptw_0_pmp_3_cfg_r,
	rocc_ptw_0_pmp_3_addr,
	rocc_ptw_0_pmp_3_mask,
	rocc_ptw_0_pmp_4_cfg_l,
	rocc_ptw_0_pmp_4_cfg_res,
	rocc_ptw_0_pmp_4_cfg_a,
	rocc_ptw_0_pmp_4_cfg_x,
	rocc_ptw_0_pmp_4_cfg_w,
	rocc_ptw_0_pmp_4_cfg_r,
	rocc_ptw_0_pmp_4_addr,
	rocc_ptw_0_pmp_4_mask,
	rocc_ptw_0_pmp_5_cfg_l,
	rocc_ptw_0_pmp_5_cfg_res,
	rocc_ptw_0_pmp_5_cfg_a,
	rocc_ptw_0_pmp_5_cfg_x,
	rocc_ptw_0_pmp_5_cfg_w,
	rocc_ptw_0_pmp_5_cfg_r,
	rocc_ptw_0_pmp_5_addr,
	rocc_ptw_0_pmp_5_mask,
	rocc_ptw_0_pmp_6_cfg_l,
	rocc_ptw_0_pmp_6_cfg_res,
	rocc_ptw_0_pmp_6_cfg_a,
	rocc_ptw_0_pmp_6_cfg_x,
	rocc_ptw_0_pmp_6_cfg_w,
	rocc_ptw_0_pmp_6_cfg_r,
	rocc_ptw_0_pmp_6_addr,
	rocc_ptw_0_pmp_6_mask,
	rocc_ptw_0_pmp_7_cfg_l,
	rocc_ptw_0_pmp_7_cfg_res,
	rocc_ptw_0_pmp_7_cfg_a,
	rocc_ptw_0_pmp_7_cfg_x,
	rocc_ptw_0_pmp_7_cfg_w,
	rocc_ptw_0_pmp_7_cfg_r,
	rocc_ptw_0_pmp_7_addr,
	rocc_ptw_0_pmp_7_mask,
	rocc_ptw_0_customCSRs_csrs_0_ren,
	rocc_ptw_0_customCSRs_csrs_0_wen,
	rocc_ptw_0_customCSRs_csrs_0_wdata,
	rocc_ptw_0_customCSRs_csrs_0_value,
	rocc_ptw_0_customCSRs_csrs_0_stall,
	rocc_ptw_0_customCSRs_csrs_0_set,
	rocc_ptw_0_customCSRs_csrs_0_sdata,
	rocc_ptw_0_customCSRs_csrs_1_ren,
	rocc_ptw_0_customCSRs_csrs_1_wen,
	rocc_ptw_0_customCSRs_csrs_1_wdata,
	rocc_ptw_0_customCSRs_csrs_1_value,
	rocc_ptw_0_customCSRs_csrs_1_stall,
	rocc_ptw_0_customCSRs_csrs_1_set,
	rocc_ptw_0_customCSRs_csrs_1_sdata,
	rocc_ptw_0_customCSRs_csrs_2_ren,
	rocc_ptw_0_customCSRs_csrs_2_wen,
	rocc_ptw_0_customCSRs_csrs_2_wdata,
	rocc_ptw_0_customCSRs_csrs_2_value,
	rocc_ptw_0_customCSRs_csrs_2_stall,
	rocc_ptw_0_customCSRs_csrs_2_set,
	rocc_ptw_0_customCSRs_csrs_2_sdata,
	rocc_ptw_0_customCSRs_csrs_3_ren,
	rocc_ptw_0_customCSRs_csrs_3_wen,
	rocc_ptw_0_customCSRs_csrs_3_wdata,
	rocc_ptw_0_customCSRs_csrs_3_value,
	rocc_ptw_0_customCSRs_csrs_3_stall,
	rocc_ptw_0_customCSRs_csrs_3_set,
	rocc_ptw_0_customCSRs_csrs_3_sdata,
	rocc_fpu_req_ready,
	rocc_fpu_req_valid,
	rocc_fpu_req_bits_ldst,
	rocc_fpu_req_bits_wen,
	rocc_fpu_req_bits_ren1,
	rocc_fpu_req_bits_ren2,
	rocc_fpu_req_bits_ren3,
	rocc_fpu_req_bits_swap12,
	rocc_fpu_req_bits_swap23,
	rocc_fpu_req_bits_typeTagIn,
	rocc_fpu_req_bits_typeTagOut,
	rocc_fpu_req_bits_fromint,
	rocc_fpu_req_bits_toint,
	rocc_fpu_req_bits_fastpipe,
	rocc_fpu_req_bits_fma,
	rocc_fpu_req_bits_div,
	rocc_fpu_req_bits_sqrt,
	rocc_fpu_req_bits_wflags,
	rocc_fpu_req_bits_vec,
	rocc_fpu_req_bits_rm,
	rocc_fpu_req_bits_fmaCmd,
	rocc_fpu_req_bits_typ,
	rocc_fpu_req_bits_fmt,
	rocc_fpu_req_bits_in1,
	rocc_fpu_req_bits_in2,
	rocc_fpu_req_bits_in3,
	rocc_fpu_resp_ready,
	rocc_fpu_resp_valid,
	rocc_fpu_resp_bits_data,
	rocc_fpu_resp_bits_exc,
	dma_a_ready,
	dma_a_valid,
	dma_a_bits_opcode,
	dma_a_bits_param,
	dma_a_bits_size,
	dma_a_bits_source,
	dma_a_bits_address,
	dma_a_bits_mask,
	dma_a_bits_data,
	dma_a_bits_corrupt,
	dma_d_ready,
	dma_d_valid,
	dma_d_bits_opcode,
	dma_d_bits_param,
	dma_d_bits_size,
	dma_d_bits_source,
	dma_d_bits_sink,
	dma_d_bits_denied,
	dma_d_bits_data,
	dma_d_bits_corrupt
);
	input clock;
	input reset;
	output wire rocc_cmd_ready;
	input rocc_cmd_valid;
	input [6:0] rocc_cmd_bits_inst_funct;
	input [4:0] rocc_cmd_bits_inst_rs2;
	input [4:0] rocc_cmd_bits_inst_rs1;
	input rocc_cmd_bits_inst_xd;
	input rocc_cmd_bits_inst_xs1;
	input rocc_cmd_bits_inst_xs2;
	input [4:0] rocc_cmd_bits_inst_rd;
	input [6:0] rocc_cmd_bits_inst_opcode;
	input [63:0] rocc_cmd_bits_rs1;
	input [63:0] rocc_cmd_bits_rs2;
	input rocc_cmd_bits_status_debug;
	input rocc_cmd_bits_status_cease;
	input rocc_cmd_bits_status_wfi;
	input [31:0] rocc_cmd_bits_status_isa;
	input [1:0] rocc_cmd_bits_status_dprv;
	input rocc_cmd_bits_status_dv;
	input [1:0] rocc_cmd_bits_status_prv;
	input rocc_cmd_bits_status_v;
	input rocc_cmd_bits_status_sd;
	input [22:0] rocc_cmd_bits_status_zero2;
	input rocc_cmd_bits_status_mpv;
	input rocc_cmd_bits_status_gva;
	input rocc_cmd_bits_status_mbe;
	input rocc_cmd_bits_status_sbe;
	input [1:0] rocc_cmd_bits_status_sxl;
	input [1:0] rocc_cmd_bits_status_uxl;
	input rocc_cmd_bits_status_sd_rv32;
	input [7:0] rocc_cmd_bits_status_zero1;
	input rocc_cmd_bits_status_tsr;
	input rocc_cmd_bits_status_tw;
	input rocc_cmd_bits_status_tvm;
	input rocc_cmd_bits_status_mxr;
	input rocc_cmd_bits_status_sum;
	input rocc_cmd_bits_status_mprv;
	input [1:0] rocc_cmd_bits_status_xs;
	input [1:0] rocc_cmd_bits_status_fs;
	input [1:0] rocc_cmd_bits_status_mpp;
	input [1:0] rocc_cmd_bits_status_vs;
	input rocc_cmd_bits_status_spp;
	input rocc_cmd_bits_status_mpie;
	input rocc_cmd_bits_status_ube;
	input rocc_cmd_bits_status_spie;
	input rocc_cmd_bits_status_upie;
	input rocc_cmd_bits_status_mie;
	input rocc_cmd_bits_status_hie;
	input rocc_cmd_bits_status_sie;
	input rocc_cmd_bits_status_uie;
	input rocc_resp_ready;
	output wire rocc_resp_valid;
	output wire [4:0] rocc_resp_bits_rd;
	output wire [63:0] rocc_resp_bits_data;
	input rocc_mem_req_ready;
	output wire rocc_mem_req_valid;
	output wire [39:0] rocc_mem_req_bits_addr;
	output wire [6:0] rocc_mem_req_bits_tag;
	output wire [4:0] rocc_mem_req_bits_cmd;
	output wire [1:0] rocc_mem_req_bits_size;
	output wire rocc_mem_req_bits_signed;
	output wire [1:0] rocc_mem_req_bits_dprv;
	output wire rocc_mem_req_bits_dv;
	output wire rocc_mem_req_bits_phys;
	output wire rocc_mem_req_bits_no_resp;
	output wire rocc_mem_req_bits_no_alloc;
	output wire rocc_mem_req_bits_no_xcpt;
	output wire [63:0] rocc_mem_req_bits_data;
	output wire [7:0] rocc_mem_req_bits_mask;
	output wire rocc_mem_s1_kill;
	output wire [63:0] rocc_mem_s1_data_data;
	output wire [7:0] rocc_mem_s1_data_mask;
	input rocc_mem_s2_nack;
	input rocc_mem_s2_nack_cause_raw;
	output wire rocc_mem_s2_kill;
	input rocc_mem_s2_uncached;
	input [31:0] rocc_mem_s2_paddr;
	input rocc_mem_resp_valid;
	input [39:0] rocc_mem_resp_bits_addr;
	input [6:0] rocc_mem_resp_bits_tag;
	input [4:0] rocc_mem_resp_bits_cmd;
	input [1:0] rocc_mem_resp_bits_size;
	input rocc_mem_resp_bits_signed;
	input [1:0] rocc_mem_resp_bits_dprv;
	input rocc_mem_resp_bits_dv;
	input [63:0] rocc_mem_resp_bits_data;
	input [7:0] rocc_mem_resp_bits_mask;
	input rocc_mem_resp_bits_replay;
	input rocc_mem_resp_bits_has_data;
	input [63:0] rocc_mem_resp_bits_data_word_bypass;
	input [63:0] rocc_mem_resp_bits_data_raw;
	input [63:0] rocc_mem_resp_bits_store_data;
	input rocc_mem_replay_next;
	input rocc_mem_s2_xcpt_ma_ld;
	input rocc_mem_s2_xcpt_ma_st;
	input rocc_mem_s2_xcpt_pf_ld;
	input rocc_mem_s2_xcpt_pf_st;
	input rocc_mem_s2_xcpt_gf_ld;
	input rocc_mem_s2_xcpt_gf_st;
	input rocc_mem_s2_xcpt_ae_ld;
	input rocc_mem_s2_xcpt_ae_st;
	input [39:0] rocc_mem_s2_gpa;
	input rocc_mem_s2_gpa_is_pte;
	input rocc_mem_ordered;
	input rocc_mem_store_pending;
	input rocc_mem_perf_acquire;
	input rocc_mem_perf_release;
	input rocc_mem_perf_grant;
	input rocc_mem_perf_tlbMiss;
	input rocc_mem_perf_blocked;
	input rocc_mem_perf_canAcceptStoreThenLoad;
	input rocc_mem_perf_canAcceptStoreThenRMW;
	input rocc_mem_perf_canAcceptLoadThenLoad;
	input rocc_mem_perf_storeBufferEmptyAfterLoad;
	input rocc_mem_perf_storeBufferEmptyAfterStore;
	output wire rocc_mem_keep_clock_enabled;
	input rocc_mem_clock_enabled;
	output wire rocc_busy;
	output wire rocc_interrupt;
	input rocc_exception;
	input rocc_ptw_0_req_ready;
	output wire rocc_ptw_0_req_valid;
	output wire rocc_ptw_0_req_bits_valid;
	output wire [26:0] rocc_ptw_0_req_bits_bits_addr;
	output wire rocc_ptw_0_req_bits_bits_need_gpa;
	output wire rocc_ptw_0_req_bits_bits_vstage1;
	output wire rocc_ptw_0_req_bits_bits_stage2;
	input rocc_ptw_0_resp_valid;
	input rocc_ptw_0_resp_bits_ae_ptw;
	input rocc_ptw_0_resp_bits_ae_final;
	input rocc_ptw_0_resp_bits_pf;
	input rocc_ptw_0_resp_bits_gf;
	input rocc_ptw_0_resp_bits_hr;
	input rocc_ptw_0_resp_bits_hw;
	input rocc_ptw_0_resp_bits_hx;
	input [9:0] rocc_ptw_0_resp_bits_pte_reserved_for_future;
	input [43:0] rocc_ptw_0_resp_bits_pte_ppn;
	input [1:0] rocc_ptw_0_resp_bits_pte_reserved_for_software;
	input rocc_ptw_0_resp_bits_pte_d;
	input rocc_ptw_0_resp_bits_pte_a;
	input rocc_ptw_0_resp_bits_pte_g;
	input rocc_ptw_0_resp_bits_pte_u;
	input rocc_ptw_0_resp_bits_pte_x;
	input rocc_ptw_0_resp_bits_pte_w;
	input rocc_ptw_0_resp_bits_pte_r;
	input rocc_ptw_0_resp_bits_pte_v;
	input [1:0] rocc_ptw_0_resp_bits_level;
	input rocc_ptw_0_resp_bits_fragmented_superpage;
	input rocc_ptw_0_resp_bits_homogeneous;
	input rocc_ptw_0_resp_bits_gpa_valid;
	input [38:0] rocc_ptw_0_resp_bits_gpa_bits;
	input rocc_ptw_0_resp_bits_gpa_is_pte;
	input [3:0] rocc_ptw_0_ptbr_mode;
	input [15:0] rocc_ptw_0_ptbr_asid;
	input [43:0] rocc_ptw_0_ptbr_ppn;
	input [3:0] rocc_ptw_0_hgatp_mode;
	input [15:0] rocc_ptw_0_hgatp_asid;
	input [43:0] rocc_ptw_0_hgatp_ppn;
	input [3:0] rocc_ptw_0_vsatp_mode;
	input [15:0] rocc_ptw_0_vsatp_asid;
	input [43:0] rocc_ptw_0_vsatp_ppn;
	input rocc_ptw_0_status_debug;
	input rocc_ptw_0_status_cease;
	input rocc_ptw_0_status_wfi;
	input [31:0] rocc_ptw_0_status_isa;
	input [1:0] rocc_ptw_0_status_dprv;
	input rocc_ptw_0_status_dv;
	input [1:0] rocc_ptw_0_status_prv;
	input rocc_ptw_0_status_v;
	input rocc_ptw_0_status_sd;
	input [22:0] rocc_ptw_0_status_zero2;
	input rocc_ptw_0_status_mpv;
	input rocc_ptw_0_status_gva;
	input rocc_ptw_0_status_mbe;
	input rocc_ptw_0_status_sbe;
	input [1:0] rocc_ptw_0_status_sxl;
	input [1:0] rocc_ptw_0_status_uxl;
	input rocc_ptw_0_status_sd_rv32;
	input [7:0] rocc_ptw_0_status_zero1;
	input rocc_ptw_0_status_tsr;
	input rocc_ptw_0_status_tw;
	input rocc_ptw_0_status_tvm;
	input rocc_ptw_0_status_mxr;
	input rocc_ptw_0_status_sum;
	input rocc_ptw_0_status_mprv;
	input [1:0] rocc_ptw_0_status_xs;
	input [1:0] rocc_ptw_0_status_fs;
	input [1:0] rocc_ptw_0_status_mpp;
	input [1:0] rocc_ptw_0_status_vs;
	input rocc_ptw_0_status_spp;
	input rocc_ptw_0_status_mpie;
	input rocc_ptw_0_status_ube;
	input rocc_ptw_0_status_spie;
	input rocc_ptw_0_status_upie;
	input rocc_ptw_0_status_mie;
	input rocc_ptw_0_status_hie;
	input rocc_ptw_0_status_sie;
	input rocc_ptw_0_status_uie;
	input [29:0] rocc_ptw_0_hstatus_zero6;
	input [1:0] rocc_ptw_0_hstatus_vsxl;
	input [8:0] rocc_ptw_0_hstatus_zero5;
	input rocc_ptw_0_hstatus_vtsr;
	input rocc_ptw_0_hstatus_vtw;
	input rocc_ptw_0_hstatus_vtvm;
	input [1:0] rocc_ptw_0_hstatus_zero3;
	input [5:0] rocc_ptw_0_hstatus_vgein;
	input [1:0] rocc_ptw_0_hstatus_zero2;
	input rocc_ptw_0_hstatus_hu;
	input rocc_ptw_0_hstatus_spvp;
	input rocc_ptw_0_hstatus_spv;
	input rocc_ptw_0_hstatus_gva;
	input rocc_ptw_0_hstatus_vsbe;
	input [4:0] rocc_ptw_0_hstatus_zero1;
	input rocc_ptw_0_gstatus_debug;
	input rocc_ptw_0_gstatus_cease;
	input rocc_ptw_0_gstatus_wfi;
	input [31:0] rocc_ptw_0_gstatus_isa;
	input [1:0] rocc_ptw_0_gstatus_dprv;
	input rocc_ptw_0_gstatus_dv;
	input [1:0] rocc_ptw_0_gstatus_prv;
	input rocc_ptw_0_gstatus_v;
	input rocc_ptw_0_gstatus_sd;
	input [22:0] rocc_ptw_0_gstatus_zero2;
	input rocc_ptw_0_gstatus_mpv;
	input rocc_ptw_0_gstatus_gva;
	input rocc_ptw_0_gstatus_mbe;
	input rocc_ptw_0_gstatus_sbe;
	input [1:0] rocc_ptw_0_gstatus_sxl;
	input [1:0] rocc_ptw_0_gstatus_uxl;
	input rocc_ptw_0_gstatus_sd_rv32;
	input [7:0] rocc_ptw_0_gstatus_zero1;
	input rocc_ptw_0_gstatus_tsr;
	input rocc_ptw_0_gstatus_tw;
	input rocc_ptw_0_gstatus_tvm;
	input rocc_ptw_0_gstatus_mxr;
	input rocc_ptw_0_gstatus_sum;
	input rocc_ptw_0_gstatus_mprv;
	input [1:0] rocc_ptw_0_gstatus_xs;
	input [1:0] rocc_ptw_0_gstatus_fs;
	input [1:0] rocc_ptw_0_gstatus_mpp;
	input [1:0] rocc_ptw_0_gstatus_vs;
	input rocc_ptw_0_gstatus_spp;
	input rocc_ptw_0_gstatus_mpie;
	input rocc_ptw_0_gstatus_ube;
	input rocc_ptw_0_gstatus_spie;
	input rocc_ptw_0_gstatus_upie;
	input rocc_ptw_0_gstatus_mie;
	input rocc_ptw_0_gstatus_hie;
	input rocc_ptw_0_gstatus_sie;
	input rocc_ptw_0_gstatus_uie;
	input rocc_ptw_0_pmp_0_cfg_l;
	input [1:0] rocc_ptw_0_pmp_0_cfg_res;
	input [1:0] rocc_ptw_0_pmp_0_cfg_a;
	input rocc_ptw_0_pmp_0_cfg_x;
	input rocc_ptw_0_pmp_0_cfg_w;
	input rocc_ptw_0_pmp_0_cfg_r;
	input [29:0] rocc_ptw_0_pmp_0_addr;
	input [31:0] rocc_ptw_0_pmp_0_mask;
	input rocc_ptw_0_pmp_1_cfg_l;
	input [1:0] rocc_ptw_0_pmp_1_cfg_res;
	input [1:0] rocc_ptw_0_pmp_1_cfg_a;
	input rocc_ptw_0_pmp_1_cfg_x;
	input rocc_ptw_0_pmp_1_cfg_w;
	input rocc_ptw_0_pmp_1_cfg_r;
	input [29:0] rocc_ptw_0_pmp_1_addr;
	input [31:0] rocc_ptw_0_pmp_1_mask;
	input rocc_ptw_0_pmp_2_cfg_l;
	input [1:0] rocc_ptw_0_pmp_2_cfg_res;
	input [1:0] rocc_ptw_0_pmp_2_cfg_a;
	input rocc_ptw_0_pmp_2_cfg_x;
	input rocc_ptw_0_pmp_2_cfg_w;
	input rocc_ptw_0_pmp_2_cfg_r;
	input [29:0] rocc_ptw_0_pmp_2_addr;
	input [31:0] rocc_ptw_0_pmp_2_mask;
	input rocc_ptw_0_pmp_3_cfg_l;
	input [1:0] rocc_ptw_0_pmp_3_cfg_res;
	input [1:0] rocc_ptw_0_pmp_3_cfg_a;
	input rocc_ptw_0_pmp_3_cfg_x;
	input rocc_ptw_0_pmp_3_cfg_w;
	input rocc_ptw_0_pmp_3_cfg_r;
	input [29:0] rocc_ptw_0_pmp_3_addr;
	input [31:0] rocc_ptw_0_pmp_3_mask;
	input rocc_ptw_0_pmp_4_cfg_l;
	input [1:0] rocc_ptw_0_pmp_4_cfg_res;
	input [1:0] rocc_ptw_0_pmp_4_cfg_a;
	input rocc_ptw_0_pmp_4_cfg_x;
	input rocc_ptw_0_pmp_4_cfg_w;
	input rocc_ptw_0_pmp_4_cfg_r;
	input [29:0] rocc_ptw_0_pmp_4_addr;
	input [31:0] rocc_ptw_0_pmp_4_mask;
	input rocc_ptw_0_pmp_5_cfg_l;
	input [1:0] rocc_ptw_0_pmp_5_cfg_res;
	input [1:0] rocc_ptw_0_pmp_5_cfg_a;
	input rocc_ptw_0_pmp_5_cfg_x;
	input rocc_ptw_0_pmp_5_cfg_w;
	input rocc_ptw_0_pmp_5_cfg_r;
	input [29:0] rocc_ptw_0_pmp_5_addr;
	input [31:0] rocc_ptw_0_pmp_5_mask;
	input rocc_ptw_0_pmp_6_cfg_l;
	input [1:0] rocc_ptw_0_pmp_6_cfg_res;
	input [1:0] rocc_ptw_0_pmp_6_cfg_a;
	input rocc_ptw_0_pmp_6_cfg_x;
	input rocc_ptw_0_pmp_6_cfg_w;
	input rocc_ptw_0_pmp_6_cfg_r;
	input [29:0] rocc_ptw_0_pmp_6_addr;
	input [31:0] rocc_ptw_0_pmp_6_mask;
	input rocc_ptw_0_pmp_7_cfg_l;
	input [1:0] rocc_ptw_0_pmp_7_cfg_res;
	input [1:0] rocc_ptw_0_pmp_7_cfg_a;
	input rocc_ptw_0_pmp_7_cfg_x;
	input rocc_ptw_0_pmp_7_cfg_w;
	input rocc_ptw_0_pmp_7_cfg_r;
	input [29:0] rocc_ptw_0_pmp_7_addr;
	input [31:0] rocc_ptw_0_pmp_7_mask;
	input rocc_ptw_0_customCSRs_csrs_0_ren;
	input rocc_ptw_0_customCSRs_csrs_0_wen;
	input [63:0] rocc_ptw_0_customCSRs_csrs_0_wdata;
	input [63:0] rocc_ptw_0_customCSRs_csrs_0_value;
	output wire rocc_ptw_0_customCSRs_csrs_0_stall;
	output wire rocc_ptw_0_customCSRs_csrs_0_set;
	output wire [63:0] rocc_ptw_0_customCSRs_csrs_0_sdata;
	input rocc_ptw_0_customCSRs_csrs_1_ren;
	input rocc_ptw_0_customCSRs_csrs_1_wen;
	input [63:0] rocc_ptw_0_customCSRs_csrs_1_wdata;
	input [63:0] rocc_ptw_0_customCSRs_csrs_1_value;
	output wire rocc_ptw_0_customCSRs_csrs_1_stall;
	output wire rocc_ptw_0_customCSRs_csrs_1_set;
	output wire [63:0] rocc_ptw_0_customCSRs_csrs_1_sdata;
	input rocc_ptw_0_customCSRs_csrs_2_ren;
	input rocc_ptw_0_customCSRs_csrs_2_wen;
	input [63:0] rocc_ptw_0_customCSRs_csrs_2_wdata;
	input [63:0] rocc_ptw_0_customCSRs_csrs_2_value;
	output wire rocc_ptw_0_customCSRs_csrs_2_stall;
	output wire rocc_ptw_0_customCSRs_csrs_2_set;
	output wire [63:0] rocc_ptw_0_customCSRs_csrs_2_sdata;
	input rocc_ptw_0_customCSRs_csrs_3_ren;
	input rocc_ptw_0_customCSRs_csrs_3_wen;
	input [63:0] rocc_ptw_0_customCSRs_csrs_3_wdata;
	input [63:0] rocc_ptw_0_customCSRs_csrs_3_value;
	output wire rocc_ptw_0_customCSRs_csrs_3_stall;
	output wire rocc_ptw_0_customCSRs_csrs_3_set;
	output wire [63:0] rocc_ptw_0_customCSRs_csrs_3_sdata;
	input rocc_fpu_req_ready;
	output wire rocc_fpu_req_valid;
	output wire rocc_fpu_req_bits_ldst;
	output wire rocc_fpu_req_bits_wen;
	output wire rocc_fpu_req_bits_ren1;
	output wire rocc_fpu_req_bits_ren2;
	output wire rocc_fpu_req_bits_ren3;
	output wire rocc_fpu_req_bits_swap12;
	output wire rocc_fpu_req_bits_swap23;
	output wire [1:0] rocc_fpu_req_bits_typeTagIn;
	output wire [1:0] rocc_fpu_req_bits_typeTagOut;
	output wire rocc_fpu_req_bits_fromint;
	output wire rocc_fpu_req_bits_toint;
	output wire rocc_fpu_req_bits_fastpipe;
	output wire rocc_fpu_req_bits_fma;
	output wire rocc_fpu_req_bits_div;
	output wire rocc_fpu_req_bits_sqrt;
	output wire rocc_fpu_req_bits_wflags;
	output wire rocc_fpu_req_bits_vec;
	output wire [2:0] rocc_fpu_req_bits_rm;
	output wire [1:0] rocc_fpu_req_bits_fmaCmd;
	output wire [1:0] rocc_fpu_req_bits_typ;
	output wire [1:0] rocc_fpu_req_bits_fmt;
	output wire [64:0] rocc_fpu_req_bits_in1;
	output wire [64:0] rocc_fpu_req_bits_in2;
	output wire [64:0] rocc_fpu_req_bits_in3;
	output wire rocc_fpu_resp_ready;
	input rocc_fpu_resp_valid;
	input [64:0] rocc_fpu_resp_bits_data;
	input [4:0] rocc_fpu_resp_bits_exc;
	input dma_a_ready;
	output wire dma_a_valid;
	output wire [2:0] dma_a_bits_opcode;
	output wire [2:0] dma_a_bits_param;
	output wire [2:0] dma_a_bits_size;
	output wire [4:0] dma_a_bits_source;
	output wire [31:0] dma_a_bits_address;
	output wire [15:0] dma_a_bits_mask;
	output wire [127:0] dma_a_bits_data;
	output wire dma_a_bits_corrupt;
	output wire dma_d_ready;
	input dma_d_valid;
	input [2:0] dma_d_bits_opcode;
	input [1:0] dma_d_bits_param;
	input [2:0] dma_d_bits_size;
	input [4:0] dma_d_bits_source;
	input dma_d_bits_sink;
	input dma_d_bits_denied;
	input [127:0] dma_d_bits_data;
	input dma_d_bits_corrupt;
	wire _accelerator_auto_spad_id_out_a_valid;
	wire [2:0] _accelerator_auto_spad_id_out_a_bits_opcode;
	wire [2:0] _accelerator_auto_spad_id_out_a_bits_param;
	wire [2:0] _accelerator_auto_spad_id_out_a_bits_size;
	wire [4:0] _accelerator_auto_spad_id_out_a_bits_source;
	wire [31:0] _accelerator_auto_spad_id_out_a_bits_address;
	wire [15:0] _accelerator_auto_spad_id_out_a_bits_mask;
	wire _accelerator_auto_spad_id_out_a_bits_corrupt;
	wire _accelerator_auto_spad_id_out_d_ready;
	Gemmini accelerator(
		.clock(clock),
		.reset(reset),
		.auto_spad_id_out_a_ready(dma_a_ready),
		.auto_spad_id_out_a_valid(_accelerator_auto_spad_id_out_a_valid),
		.auto_spad_id_out_a_bits_opcode(_accelerator_auto_spad_id_out_a_bits_opcode),
		.auto_spad_id_out_a_bits_param(_accelerator_auto_spad_id_out_a_bits_param),
		.auto_spad_id_out_a_bits_size(_accelerator_auto_spad_id_out_a_bits_size),
		.auto_spad_id_out_a_bits_source(_accelerator_auto_spad_id_out_a_bits_source),
		.auto_spad_id_out_a_bits_address(_accelerator_auto_spad_id_out_a_bits_address),
		.auto_spad_id_out_a_bits_mask(_accelerator_auto_spad_id_out_a_bits_mask),
		.auto_spad_id_out_a_bits_data(dma_a_bits_data),
		.auto_spad_id_out_a_bits_corrupt(_accelerator_auto_spad_id_out_a_bits_corrupt),
		.auto_spad_id_out_d_ready(_accelerator_auto_spad_id_out_d_ready),
		.auto_spad_id_out_d_valid(dma_d_valid),
		.auto_spad_id_out_d_bits_opcode(dma_d_bits_opcode),
		.auto_spad_id_out_d_bits_param(dma_d_bits_param),
		.auto_spad_id_out_d_bits_size(dma_d_bits_size),
		.auto_spad_id_out_d_bits_source(dma_d_bits_source),
		.auto_spad_id_out_d_bits_sink(dma_d_bits_sink),
		.auto_spad_id_out_d_bits_denied(dma_d_bits_denied),
		.auto_spad_id_out_d_bits_data(dma_d_bits_data),
		.auto_spad_id_out_d_bits_corrupt(dma_d_bits_corrupt),
		.io_cmd_ready(rocc_cmd_ready),
		.io_cmd_valid(rocc_cmd_valid),
		.io_cmd_bits_inst_funct(rocc_cmd_bits_inst_funct),
		.io_cmd_bits_inst_rs2(rocc_cmd_bits_inst_rs2),
		.io_cmd_bits_inst_rs1(rocc_cmd_bits_inst_rs1),
		.io_cmd_bits_inst_xd(rocc_cmd_bits_inst_xd),
		.io_cmd_bits_inst_xs1(rocc_cmd_bits_inst_xs1),
		.io_cmd_bits_inst_xs2(rocc_cmd_bits_inst_xs2),
		.io_cmd_bits_inst_rd(rocc_cmd_bits_inst_rd),
		.io_cmd_bits_inst_opcode(rocc_cmd_bits_inst_opcode),
		.io_cmd_bits_rs1(rocc_cmd_bits_rs1),
		.io_cmd_bits_rs2(rocc_cmd_bits_rs2),
		.io_cmd_bits_status_debug(rocc_cmd_bits_status_debug),
		.io_cmd_bits_status_cease(rocc_cmd_bits_status_cease),
		.io_cmd_bits_status_wfi(rocc_cmd_bits_status_wfi),
		.io_cmd_bits_status_isa(rocc_cmd_bits_status_isa),
		.io_cmd_bits_status_dprv(rocc_cmd_bits_status_dprv),
		.io_cmd_bits_status_dv(rocc_cmd_bits_status_dv),
		.io_cmd_bits_status_prv(rocc_cmd_bits_status_prv),
		.io_cmd_bits_status_v(rocc_cmd_bits_status_v),
		.io_cmd_bits_status_sd(rocc_cmd_bits_status_sd),
		.io_cmd_bits_status_zero2(rocc_cmd_bits_status_zero2),
		.io_cmd_bits_status_mpv(rocc_cmd_bits_status_mpv),
		.io_cmd_bits_status_gva(rocc_cmd_bits_status_gva),
		.io_cmd_bits_status_mbe(rocc_cmd_bits_status_mbe),
		.io_cmd_bits_status_sbe(rocc_cmd_bits_status_sbe),
		.io_cmd_bits_status_sxl(rocc_cmd_bits_status_sxl),
		.io_cmd_bits_status_uxl(rocc_cmd_bits_status_uxl),
		.io_cmd_bits_status_sd_rv32(rocc_cmd_bits_status_sd_rv32),
		.io_cmd_bits_status_zero1(rocc_cmd_bits_status_zero1),
		.io_cmd_bits_status_tsr(rocc_cmd_bits_status_tsr),
		.io_cmd_bits_status_tw(rocc_cmd_bits_status_tw),
		.io_cmd_bits_status_tvm(rocc_cmd_bits_status_tvm),
		.io_cmd_bits_status_mxr(rocc_cmd_bits_status_mxr),
		.io_cmd_bits_status_sum(rocc_cmd_bits_status_sum),
		.io_cmd_bits_status_mprv(rocc_cmd_bits_status_mprv),
		.io_cmd_bits_status_xs(rocc_cmd_bits_status_xs),
		.io_cmd_bits_status_fs(rocc_cmd_bits_status_fs),
		.io_cmd_bits_status_mpp(rocc_cmd_bits_status_mpp),
		.io_cmd_bits_status_vs(rocc_cmd_bits_status_vs),
		.io_cmd_bits_status_spp(rocc_cmd_bits_status_spp),
		.io_cmd_bits_status_mpie(rocc_cmd_bits_status_mpie),
		.io_cmd_bits_status_ube(rocc_cmd_bits_status_ube),
		.io_cmd_bits_status_spie(rocc_cmd_bits_status_spie),
		.io_cmd_bits_status_upie(rocc_cmd_bits_status_upie),
		.io_cmd_bits_status_mie(rocc_cmd_bits_status_mie),
		.io_cmd_bits_status_hie(rocc_cmd_bits_status_hie),
		.io_cmd_bits_status_sie(rocc_cmd_bits_status_sie),
		.io_cmd_bits_status_uie(rocc_cmd_bits_status_uie),
		.io_resp_ready(rocc_resp_ready),
		.io_resp_valid(rocc_resp_valid),
		.io_resp_bits_rd(rocc_resp_bits_rd),
		.io_resp_bits_data(rocc_resp_bits_data),
		.io_busy(rocc_busy),
		.io_interrupt(rocc_interrupt),
		.io_ptw_0_req_ready(rocc_ptw_0_req_ready),
		.io_ptw_0_req_valid(rocc_ptw_0_req_valid),
		.io_ptw_0_req_bits_bits_addr(rocc_ptw_0_req_bits_bits_addr),
		.io_ptw_0_req_bits_bits_need_gpa(rocc_ptw_0_req_bits_bits_need_gpa),
		.io_ptw_0_resp_valid(rocc_ptw_0_resp_valid),
		.io_ptw_0_resp_bits_ae_ptw(rocc_ptw_0_resp_bits_ae_ptw),
		.io_ptw_0_resp_bits_ae_final(rocc_ptw_0_resp_bits_ae_final),
		.io_ptw_0_resp_bits_pf(rocc_ptw_0_resp_bits_pf),
		.io_ptw_0_resp_bits_gf(rocc_ptw_0_resp_bits_gf),
		.io_ptw_0_resp_bits_hr(rocc_ptw_0_resp_bits_hr),
		.io_ptw_0_resp_bits_hw(rocc_ptw_0_resp_bits_hw),
		.io_ptw_0_resp_bits_hx(rocc_ptw_0_resp_bits_hx),
		.io_ptw_0_resp_bits_pte_ppn(rocc_ptw_0_resp_bits_pte_ppn),
		.io_ptw_0_resp_bits_pte_d(rocc_ptw_0_resp_bits_pte_d),
		.io_ptw_0_resp_bits_pte_a(rocc_ptw_0_resp_bits_pte_a),
		.io_ptw_0_resp_bits_pte_g(rocc_ptw_0_resp_bits_pte_g),
		.io_ptw_0_resp_bits_pte_u(rocc_ptw_0_resp_bits_pte_u),
		.io_ptw_0_resp_bits_pte_x(rocc_ptw_0_resp_bits_pte_x),
		.io_ptw_0_resp_bits_pte_w(rocc_ptw_0_resp_bits_pte_w),
		.io_ptw_0_resp_bits_pte_r(rocc_ptw_0_resp_bits_pte_r),
		.io_ptw_0_resp_bits_pte_v(rocc_ptw_0_resp_bits_pte_v),
		.io_ptw_0_resp_bits_level(rocc_ptw_0_resp_bits_level),
		.io_ptw_0_resp_bits_fragmented_superpage(rocc_ptw_0_resp_bits_fragmented_superpage),
		.io_ptw_0_resp_bits_homogeneous(rocc_ptw_0_resp_bits_homogeneous),
		.io_ptw_0_ptbr_mode(rocc_ptw_0_ptbr_mode),
		.io_ptw_0_pmp_0_cfg_l(rocc_ptw_0_pmp_0_cfg_l),
		.io_ptw_0_pmp_0_cfg_a(rocc_ptw_0_pmp_0_cfg_a),
		.io_ptw_0_pmp_0_cfg_x(rocc_ptw_0_pmp_0_cfg_x),
		.io_ptw_0_pmp_0_cfg_w(rocc_ptw_0_pmp_0_cfg_w),
		.io_ptw_0_pmp_0_cfg_r(rocc_ptw_0_pmp_0_cfg_r),
		.io_ptw_0_pmp_0_addr(rocc_ptw_0_pmp_0_addr),
		.io_ptw_0_pmp_0_mask(rocc_ptw_0_pmp_0_mask),
		.io_ptw_0_pmp_1_cfg_l(rocc_ptw_0_pmp_1_cfg_l),
		.io_ptw_0_pmp_1_cfg_a(rocc_ptw_0_pmp_1_cfg_a),
		.io_ptw_0_pmp_1_cfg_x(rocc_ptw_0_pmp_1_cfg_x),
		.io_ptw_0_pmp_1_cfg_w(rocc_ptw_0_pmp_1_cfg_w),
		.io_ptw_0_pmp_1_cfg_r(rocc_ptw_0_pmp_1_cfg_r),
		.io_ptw_0_pmp_1_addr(rocc_ptw_0_pmp_1_addr),
		.io_ptw_0_pmp_1_mask(rocc_ptw_0_pmp_1_mask),
		.io_ptw_0_pmp_2_cfg_l(rocc_ptw_0_pmp_2_cfg_l),
		.io_ptw_0_pmp_2_cfg_a(rocc_ptw_0_pmp_2_cfg_a),
		.io_ptw_0_pmp_2_cfg_x(rocc_ptw_0_pmp_2_cfg_x),
		.io_ptw_0_pmp_2_cfg_w(rocc_ptw_0_pmp_2_cfg_w),
		.io_ptw_0_pmp_2_cfg_r(rocc_ptw_0_pmp_2_cfg_r),
		.io_ptw_0_pmp_2_addr(rocc_ptw_0_pmp_2_addr),
		.io_ptw_0_pmp_2_mask(rocc_ptw_0_pmp_2_mask),
		.io_ptw_0_pmp_3_cfg_l(rocc_ptw_0_pmp_3_cfg_l),
		.io_ptw_0_pmp_3_cfg_a(rocc_ptw_0_pmp_3_cfg_a),
		.io_ptw_0_pmp_3_cfg_x(rocc_ptw_0_pmp_3_cfg_x),
		.io_ptw_0_pmp_3_cfg_w(rocc_ptw_0_pmp_3_cfg_w),
		.io_ptw_0_pmp_3_cfg_r(rocc_ptw_0_pmp_3_cfg_r),
		.io_ptw_0_pmp_3_addr(rocc_ptw_0_pmp_3_addr),
		.io_ptw_0_pmp_3_mask(rocc_ptw_0_pmp_3_mask),
		.io_ptw_0_pmp_4_cfg_l(rocc_ptw_0_pmp_4_cfg_l),
		.io_ptw_0_pmp_4_cfg_a(rocc_ptw_0_pmp_4_cfg_a),
		.io_ptw_0_pmp_4_cfg_x(rocc_ptw_0_pmp_4_cfg_x),
		.io_ptw_0_pmp_4_cfg_w(rocc_ptw_0_pmp_4_cfg_w),
		.io_ptw_0_pmp_4_cfg_r(rocc_ptw_0_pmp_4_cfg_r),
		.io_ptw_0_pmp_4_addr(rocc_ptw_0_pmp_4_addr),
		.io_ptw_0_pmp_4_mask(rocc_ptw_0_pmp_4_mask),
		.io_ptw_0_pmp_5_cfg_l(rocc_ptw_0_pmp_5_cfg_l),
		.io_ptw_0_pmp_5_cfg_a(rocc_ptw_0_pmp_5_cfg_a),
		.io_ptw_0_pmp_5_cfg_x(rocc_ptw_0_pmp_5_cfg_x),
		.io_ptw_0_pmp_5_cfg_w(rocc_ptw_0_pmp_5_cfg_w),
		.io_ptw_0_pmp_5_cfg_r(rocc_ptw_0_pmp_5_cfg_r),
		.io_ptw_0_pmp_5_addr(rocc_ptw_0_pmp_5_addr),
		.io_ptw_0_pmp_5_mask(rocc_ptw_0_pmp_5_mask),
		.io_ptw_0_pmp_6_cfg_l(rocc_ptw_0_pmp_6_cfg_l),
		.io_ptw_0_pmp_6_cfg_a(rocc_ptw_0_pmp_6_cfg_a),
		.io_ptw_0_pmp_6_cfg_x(rocc_ptw_0_pmp_6_cfg_x),
		.io_ptw_0_pmp_6_cfg_w(rocc_ptw_0_pmp_6_cfg_w),
		.io_ptw_0_pmp_6_cfg_r(rocc_ptw_0_pmp_6_cfg_r),
		.io_ptw_0_pmp_6_addr(rocc_ptw_0_pmp_6_addr),
		.io_ptw_0_pmp_6_mask(rocc_ptw_0_pmp_6_mask),
		.io_ptw_0_pmp_7_cfg_l(rocc_ptw_0_pmp_7_cfg_l),
		.io_ptw_0_pmp_7_cfg_a(rocc_ptw_0_pmp_7_cfg_a),
		.io_ptw_0_pmp_7_cfg_x(rocc_ptw_0_pmp_7_cfg_x),
		.io_ptw_0_pmp_7_cfg_w(rocc_ptw_0_pmp_7_cfg_w),
		.io_ptw_0_pmp_7_cfg_r(rocc_ptw_0_pmp_7_cfg_r),
		.io_ptw_0_pmp_7_addr(rocc_ptw_0_pmp_7_addr),
		.io_ptw_0_pmp_7_mask(rocc_ptw_0_pmp_7_mask)
	);
	TLMonitor_5 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(dma_a_ready),
		.io_in_a_valid(_accelerator_auto_spad_id_out_a_valid),
		.io_in_a_bits_opcode(_accelerator_auto_spad_id_out_a_bits_opcode),
		.io_in_a_bits_param(_accelerator_auto_spad_id_out_a_bits_param),
		.io_in_a_bits_size(_accelerator_auto_spad_id_out_a_bits_size),
		.io_in_a_bits_source(_accelerator_auto_spad_id_out_a_bits_source),
		.io_in_a_bits_address(_accelerator_auto_spad_id_out_a_bits_address),
		.io_in_a_bits_mask(_accelerator_auto_spad_id_out_a_bits_mask),
		.io_in_a_bits_corrupt(_accelerator_auto_spad_id_out_a_bits_corrupt),
		.io_in_d_ready(_accelerator_auto_spad_id_out_d_ready),
		.io_in_d_valid(dma_d_valid),
		.io_in_d_bits_opcode(dma_d_bits_opcode),
		.io_in_d_bits_param(dma_d_bits_param),
		.io_in_d_bits_size(dma_d_bits_size),
		.io_in_d_bits_source(dma_d_bits_source),
		.io_in_d_bits_sink(dma_d_bits_sink),
		.io_in_d_bits_denied(dma_d_bits_denied),
		.io_in_d_bits_corrupt(dma_d_bits_corrupt)
	);
	assign rocc_mem_req_valid = 1'h0;
	assign rocc_mem_req_bits_addr = 40'h0000000000;
	assign rocc_mem_req_bits_tag = 7'h00;
	assign rocc_mem_req_bits_cmd = 5'h00;
	assign rocc_mem_req_bits_size = 2'h0;
	assign rocc_mem_req_bits_signed = 1'h0;
	assign rocc_mem_req_bits_dprv = 2'h0;
	assign rocc_mem_req_bits_dv = 1'h0;
	assign rocc_mem_req_bits_phys = 1'h0;
	assign rocc_mem_req_bits_no_resp = 1'h0;
	assign rocc_mem_req_bits_no_alloc = 1'h0;
	assign rocc_mem_req_bits_no_xcpt = 1'h0;
	assign rocc_mem_req_bits_data = 64'h0000000000000000;
	assign rocc_mem_req_bits_mask = 8'h00;
	assign rocc_mem_s1_kill = 1'h0;
	assign rocc_mem_s1_data_data = 64'h0000000000000000;
	assign rocc_mem_s1_data_mask = 8'h00;
	assign rocc_mem_s2_kill = 1'h0;
	assign rocc_mem_keep_clock_enabled = 1'h0;
	assign rocc_ptw_0_req_bits_valid = 1'h1;
	assign rocc_ptw_0_req_bits_bits_vstage1 = 1'h0;
	assign rocc_ptw_0_req_bits_bits_stage2 = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_0_stall = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_0_set = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_0_sdata = 64'h0000000000000000;
	assign rocc_ptw_0_customCSRs_csrs_1_stall = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_1_set = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_1_sdata = 64'h0000000000000000;
	assign rocc_ptw_0_customCSRs_csrs_2_stall = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_2_set = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_2_sdata = 64'h0000000000000000;
	assign rocc_ptw_0_customCSRs_csrs_3_stall = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_3_set = 1'h0;
	assign rocc_ptw_0_customCSRs_csrs_3_sdata = 64'h0000000000000000;
	assign rocc_fpu_req_valid = 1'h0;
	assign rocc_fpu_req_bits_ldst = 1'h0;
	assign rocc_fpu_req_bits_wen = 1'h0;
	assign rocc_fpu_req_bits_ren1 = 1'h0;
	assign rocc_fpu_req_bits_ren2 = 1'h0;
	assign rocc_fpu_req_bits_ren3 = 1'h0;
	assign rocc_fpu_req_bits_swap12 = 1'h0;
	assign rocc_fpu_req_bits_swap23 = 1'h0;
	assign rocc_fpu_req_bits_typeTagIn = 2'h0;
	assign rocc_fpu_req_bits_typeTagOut = 2'h0;
	assign rocc_fpu_req_bits_fromint = 1'h0;
	assign rocc_fpu_req_bits_toint = 1'h0;
	assign rocc_fpu_req_bits_fastpipe = 1'h0;
	assign rocc_fpu_req_bits_fma = 1'h0;
	assign rocc_fpu_req_bits_div = 1'h0;
	assign rocc_fpu_req_bits_sqrt = 1'h0;
	assign rocc_fpu_req_bits_wflags = 1'h0;
	assign rocc_fpu_req_bits_vec = 1'h0;
	assign rocc_fpu_req_bits_rm = 3'h0;
	assign rocc_fpu_req_bits_fmaCmd = 2'h0;
	assign rocc_fpu_req_bits_typ = 2'h0;
	assign rocc_fpu_req_bits_fmt = 2'h0;
	assign rocc_fpu_req_bits_in1 = 65'h00000000000000000;
	assign rocc_fpu_req_bits_in2 = 65'h00000000000000000;
	assign rocc_fpu_req_bits_in3 = 65'h00000000000000000;
	assign rocc_fpu_resp_ready = 1'h0;
	assign dma_a_valid = _accelerator_auto_spad_id_out_a_valid;
	assign dma_a_bits_opcode = _accelerator_auto_spad_id_out_a_bits_opcode;
	assign dma_a_bits_param = _accelerator_auto_spad_id_out_a_bits_param;
	assign dma_a_bits_size = _accelerator_auto_spad_id_out_a_bits_size;
	assign dma_a_bits_source = _accelerator_auto_spad_id_out_a_bits_source;
	assign dma_a_bits_address = _accelerator_auto_spad_id_out_a_bits_address;
	assign dma_a_bits_mask = _accelerator_auto_spad_id_out_a_bits_mask;
	assign dma_a_bits_corrupt = _accelerator_auto_spad_id_out_a_bits_corrupt;
	assign dma_d_ready = _accelerator_auto_spad_id_out_d_ready;
endmodule
