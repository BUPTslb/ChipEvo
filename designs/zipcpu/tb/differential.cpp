#include "Vdut.h"
#include "verilated.h"
#include <iostream>
#include <cstdint>
uint32_t state=1; uint32_t rng(){state^=state<<13;state^=state>>17;state^=state<<5;return state;}
int main(int argc,char** argv){ Verilated::commandArgs(argc,argv); Vdut d;
d.i_clk=0;
d.i_reset=0;
d.i_interrupt=0;
d.i_halt=0;
d.i_clear_cache=0;
d.i_dbg_wreg=0;
d.i_dbg_we=0;
d.i_dbg_data=0;
d.i_dbg_rreg=0;
d.i_pf_valid=0;
d.i_pf_illegal=0;
d.i_pf_instruction=0;
d.i_pf_instruction_pc=0;
d.i_mem_busy=0;
d.i_mem_rdbusy=0;
d.i_mem_pipe_stalled=0;
d.i_mem_valid=0;
d.i_bus_err=0;
d.i_mem_wreg=0;
d.i_mem_result=0;
for(int cycle=0;cycle<1024;cycle++){
d.i_interrupt=(cycle<32)?0:(rng() & 0x1u);
d.i_halt=(cycle<32)?0:(rng() & 0x1u);
d.i_clear_cache=(cycle<32)?0:(rng() & 0x1u);
d.i_dbg_wreg=(cycle<32)?0:(rng() & 0x1fu);
d.i_dbg_we=(cycle<32)?0:(rng() & 0x1u);
d.i_dbg_data=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_dbg_rreg=(cycle<32)?0:(rng() & 0x1fu);
d.i_pf_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_pf_illegal=(cycle<32)?0:(rng() & 0x1u);
d.i_pf_instruction=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_pf_instruction_pc=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_mem_busy=(cycle<32)?0:(rng() & 0x1u);
d.i_mem_rdbusy=(cycle<32)?0:(rng() & 0x1u);
d.i_mem_pipe_stalled=(cycle<32)?0:(rng() & 0x1u);
d.i_mem_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_bus_err=(cycle<32)?0:(rng() & 0x1u);
d.i_mem_wreg=(cycle<32)?0:(rng() & 0x1fu);
d.i_mem_result=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_reset=((cycle%256)<16)?1:0;
d.i_clk=0;
d.eval();
d.i_clk=1;
d.eval();
std::cout << cycle;
std::cout << " o_clken=" << uint64_t(d.o_clken);
std::cout << " o_dbg_stall=" << uint64_t(d.o_dbg_stall);
std::cout << " o_dbg_reg=" << uint64_t(d.o_dbg_reg);
std::cout << " o_dbg_cc=" << uint64_t(d.o_dbg_cc);
std::cout << " o_break=" << uint64_t(d.o_break);
std::cout << " o_pf_new_pc=" << uint64_t(d.o_pf_new_pc);
std::cout << " o_clear_icache=" << uint64_t(d.o_clear_icache);
std::cout << " o_pf_ready=" << uint64_t(d.o_pf_ready);
std::cout << " o_pf_request_address=" << uint64_t(d.o_pf_request_address);
std::cout << " o_clear_dcache=" << uint64_t(d.o_clear_dcache);
std::cout << " o_mem_ce=" << uint64_t(d.o_mem_ce);
std::cout << " o_bus_lock=" << uint64_t(d.o_bus_lock);
std::cout << " o_mem_op=" << uint64_t(d.o_mem_op);
std::cout << " o_mem_addr=" << uint64_t(d.o_mem_addr);
std::cout << " o_mem_data=" << uint64_t(d.o_mem_data);
std::cout << " o_mem_lock_pc=" << uint64_t(d.o_mem_lock_pc);
std::cout << " o_mem_reg=" << uint64_t(d.o_mem_reg);
std::cout << " o_op_stall=" << uint64_t(d.o_op_stall);
std::cout << " o_pf_stall=" << uint64_t(d.o_pf_stall);
std::cout << " o_i_count=" << uint64_t(d.o_i_count);
std::cout << " o_debug=" << uint64_t(d.o_debug);
std::cout << " o_prof_stb=" << uint64_t(d.o_prof_stb);
std::cout << " o_prof_addr=" << uint64_t(d.o_prof_addr);
std::cout << " o_prof_ticks=" << uint64_t(d.o_prof_ticks);
std::cout << "\n";
} d.final(); return 0;}
