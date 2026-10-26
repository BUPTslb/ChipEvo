#include "Vdut.h"
#include "verilated.h"
#include <iostream>
#include <cstdint>
uint32_t state=1; uint32_t rng(){state^=state<<13;state^=state>>17;state^=state<<5;return state;}
int main(int argc,char** argv){ Verilated::commandArgs(argc,argv); Vdut d;
d.clk=0;
d.rst_n=0;
d.i_feather_top_en=0;
d.i_iacts_zp=0;
d.i_iacts_zp_valid=0;
d.i_weights_zp=0;
d.i_weights_zp_valid=0;
d.i_weights_write_valid=0;
d.i_weights_write_data=0;
d.i_weights_write_addr=0;
d.i_weights_write_addr_end=0;
d.i_iacts_write_valid=0;
d.i_iacts_write_data=0;
d.i_iacts_write_addr=0;
d.i_iacts_write_addr_end=0;
d.i_instr_write_valid=0;
d.i_instr_write_data=0;
d.i_instr_write_addr=0;
d.i_all_buf_pingpong_config=0;
d.i_outbuf_wr_instr=0;
d.i_scale_val=0;
d.i_oacts_read_valid=0;
d.i_oacts_read_addr=0;
d.i_oacts_read_addr_end=0;
for(int cycle=0;cycle<1024;cycle++){
d.i_feather_top_en=(cycle<32)?0:(rng() & 0x1u);
d.i_iacts_zp=(cycle<32)?0:(rng() & 0xffu);
d.i_iacts_zp_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_weights_zp=(cycle<32)?0:(rng() & 0xffu);
d.i_weights_zp_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_weights_write_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_weights_write_data=(cycle<32)?0:(((uint64_t(rng())<<32)|rng()) & 0xffffffffffffffffull);
d.i_weights_write_addr=(cycle<32)?0:(rng() & 0x3u);
d.i_weights_write_addr_end=(cycle<32)?0:(rng() & 0x3u);
d.i_iacts_write_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_iacts_write_data=(cycle<32)?0:(((uint64_t(rng())<<32)|rng()) & 0xffffffffffffffffull);
d.i_iacts_write_addr=(cycle<32)?0:(rng() & 0x3u);
d.i_iacts_write_addr_end=(cycle<32)?0:(rng() & 0x3u);
d.i_instr_write_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_instr_write_data=(cycle<32)?0:(((uint64_t(rng())<<32)|rng()) & 0xffffffffffffull);
d.i_instr_write_addr=(cycle<32)?0:(rng() & 0x3u);
d.i_all_buf_pingpong_config=(cycle<32)?0:(rng() & 0xffu);
d.i_outbuf_wr_instr=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_scale_val=(cycle<32)?0:(rng() & 0xffffffffu);
d.i_oacts_read_valid=(cycle<32)?0:(rng() & 0x1u);
d.i_oacts_read_addr=(cycle<32)?0:(rng() & 0xffffu);
d.i_oacts_read_addr_end=(cycle<32)?0:(rng() & 0xffffu);
d.rst_n=((cycle%256)<16)?0:1;
d.clk=0;
d.eval();
d.clk=1;
d.eval();
std::cout << cycle;
std::cout << " o_outbuf_data_wr_rdy=" << uint64_t(d.o_outbuf_data_wr_rdy);
std::cout << " o_oacts_read_data=" << uint64_t(d.o_oacts_read_data);
std::cout << "\n";
} d.final(); return 0;}
