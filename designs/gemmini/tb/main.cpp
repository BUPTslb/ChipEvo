#include "VStandalone.h"
#include "verilated.h"
#include <array>
#include <vector>
#include <deque>
#include <iostream>
#include <stdexcept>
#include <cstring>
#include "../model/golden.hpp"
struct Resp { unsigned op,size,source; std::array<uint32_t,4> data{}; };
struct Sim {
 VStandalone d;
 std::vector<uint8_t> mem = std::vector<uint8_t>(1<<20);
 std::deque<Resp> q;
 uint64_t cycles=0;
 unsigned putBeat=0;
 Sim() {
#include "init_inputs.inc"
  d.rocc_resp_ready=1;
  d.rocc_cmd_bits_status_prv=3;
  d.rocc_cmd_bits_status_dprv=3;
  d.rocc_ptw_0_status_prv=3;
  d.rocc_ptw_0_status_dprv=3;
  d.reset=1; for(int i=0;i<10;i++) tick(); d.reset=0;
  for(int i=0;i<10;i++) tick();
 }
 void tick() {
  if(++cycles>2000000) throw std::runtime_error("simulation timeout");
  d.clock=0;
  d.dma_a_ready=(cycles%7!=0); // exercise A-channel backpressure
  d.dma_d_valid=!q.empty();
  if(!q.empty()) {
   auto &r=q.front(); d.dma_d_bits_opcode=r.op; d.dma_d_bits_size=r.size;
   d.dma_d_bits_source=r.source;
   for(int i=0;i<4;i++) d.dma_d_bits_data[i]=r.data[i];
  }
  d.eval();
  bool pop=d.dma_d_valid&&d.dma_d_ready;
  bool take=d.dma_a_valid&&d.dma_a_ready;
  unsigned op=d.dma_a_bits_opcode, size=d.dma_a_bits_size, src=d.dma_a_bits_source;
  unsigned addr=d.dma_a_bits_address,mask=d.dma_a_bits_mask;
  std::array<uint32_t,4> data;
  for(int i=0;i<4;i++) data[i]=d.dma_a_bits_data[i];
  if(d.rocc_ptw_0_req_valid || d.rocc_mem_req_valid)
    throw std::runtime_error("unexpected PTW/cache request in physical-address test");
  d.clock=1; d.eval();
  if(pop) q.pop_front();
  if(take) {
   unsigned beats=std::max(1u,(1u<<size)/16);
   if(addr+16*beats>=mem.size()) throw std::runtime_error("DMA out of model bounds");
   if(op==4) {
    for(unsigned b=0;b<beats;b++) {
     Resp r{1,size,src,{}};
     for(int i=0;i<16;i++) r.data[i/4]|=uint32_t(mem[(addr&~15u)+b*16+i])<<(8*(i%4));
     q.push_back(r);
    }
   } else if(op==0 || op==1) {
    for(int i=0;i<16;i++) if(mask&(1u<<i))
      mem[(addr&~15u)+putBeat*16+i]=uint8_t(data[i/4]>>(8*(i%4)));
    if(++putBeat==beats) {q.push_back(Resp{0,size,src,{}});putBeat=0;}
   } else throw std::runtime_error("unsupported TileLink opcode");
  }
 }
 void cmd(unsigned f,uint64_t a,uint64_t b) {
  d.rocc_cmd_bits_inst_opcode=0x7b; d.rocc_cmd_bits_inst_funct=f;
  d.rocc_cmd_bits_inst_xs1=1; d.rocc_cmd_bits_inst_xs2=1;
  d.rocc_cmd_bits_rs1=a; d.rocc_cmd_bits_rs2=b; d.rocc_cmd_valid=1;
  for(unsigned t=0;t<100000;t++) {
   d.clock=0;d.eval(); bool ready=d.rocc_cmd_ready; tick();
   if(ready) {d.rocc_cmd_valid=0; return;}
  }
  throw std::runtime_error("command timeout");
 }
 void drain() {
  unsigned quiet=0;
  for(unsigned t=0;t<100000;t++) {
   tick(); quiet=(!d.rocc_busy && q.empty() && !d.dma_a_valid)?quiet+1:0;
   if(quiet==40)return;
  }
  throw std::runtime_error("drain timeout");
 }
};
uint64_t shape(uint32_t a,unsigned rows=16,unsigned cols=16) {
 return (uint64_t(rows)<<48)|(uint64_t(cols)<<32)|a;
}
int main(int argc,char**argv) {
 Verilated::commandArgs(argc,argv);
 try {
 Sim s;
 const uint64_t one=uint64_t(0x3f800000)<<32;
 s.cmd(0,one|(16u<<16)|(1u<<8)|1,16); // config load: scale 1, stride 16
 s.cmd(0,2,one|16); // config store
 for(int i=0;i<256;i++) s.mem[0x1000+i]=uint8_t(i*7);
 s.cmd(2,0x1000,shape(0)); s.cmd(3,0x2000,shape(0)); s.drain();
 for(int i=0;i<256;i++) if(s.mem[0x1000+i]!=s.mem[0x2000+i])
   throw std::runtime_error("mvin/mvout mismatch at "+std::to_string(i));
 std::cout<<"PASS mvin_mvout 256 bytes\n";
 // Partial rows/columns exercise byte masks and all four scratchpad banks.
 for(unsigned bank=0;bank<4;bank++){
  for(int i=0;i<256;i++){s.mem[0x8000+i]=uint8_t(i*11+bank);s.mem[0x9000+i]=0xa5;}
  s.cmd(2,0x8000,shape(bank*4096,7,13));
  s.cmd(3,0x9000,shape(bank*4096,7,13));s.drain();
  for(int i=0;i<16;i++)for(int j=0;j<16;j++){
   uint8_t expected=(i<7&&j<13)?s.mem[0x8000+i*16+j]:0xa5;
   if(s.mem[0x9000+i*16+j]!=expected)throw std::runtime_error("partial DMA mask mismatch");
  }
  std::cout<<"PASS scratchpad bank "<<bank<<" partial 7x13 and output guards\n";
 }
 // Output stationary, no activation, shift zero, A/C stride one.
 s.cmd(0,one|(1u<<16),uint64_t(1)<<48);
 for(int i=0;i<256;i++) { s.mem[0x3000+i]=uint8_t((i*3)%7-3); s.mem[0x4000+i]=uint8_t((i*5)%7-3); }
 s.cmd(2,0x3000,shape(0)); s.cmd(2,0x4000,shape(16));
 s.cmd(6,shape(0xffffffff),shape(32)); // preload zeros into output tile
 s.cmd(4,shape(0),shape(16)); // compute preloaded
 s.cmd(3,0x5000,shape(32)); s.drain();
 auto ref=golden::matmul(reinterpret_cast<int8_t*>(&s.mem[0x3000]),reinterpret_cast<int8_t*>(&s.mem[0x4000]));
 for(int i=0;i<256;i++) if(int8_t(s.mem[0x5000+i])!=golden::saturate(ref[i]))
   throw std::runtime_error("OS mismatch at "+std::to_string(i));
 std::cout<<"PASS OS matmul signed INT8 16x16; cycles="<<s.cycles<<"\n";
 // Weight stationary, INT32 accumulator output; verify large products too.
 for(int trial=0;trial<4;trial++){
  unsigned accrow=(trial%2)*512;
  for(int i=0;i<256;i++) {
   s.mem[0x3000+i]=uint8_t(trial==0?127:((i*17+trial*11)%256)-128);
   s.mem[0x4000+i]=uint8_t(trial==0?-128:((i*31+trial*7)%256)-128);
  }
  s.cmd(0,one|(1u<<16)|4,uint64_t(1)<<48);
  s.cmd(2,0x3000,shape(0));s.cmd(2,0x4000,shape(16));
  s.cmd(6,shape(16),shape(0x80000000u | accrow));
  s.cmd(4,shape(0),shape(0xffffffffu));
  s.cmd(0,2,one|64);
  s.cmd(3,0x6000,shape(0xa0000000u | accrow));s.drain();
  auto full=golden::matmul(reinterpret_cast<int8_t*>(&s.mem[0x3000]),reinterpret_cast<int8_t*>(&s.mem[0x4000]));
  for(int i=0;i<256;i++){
   int32_t got;std::memcpy(&got,&s.mem[0x6000+4*i],4);
   if(got!=full[i])throw std::runtime_error("WS accumulator mismatch trial "+std::to_string(trial)+" index "+std::to_string(i)+" expected "+std::to_string(full[i])+" got "+std::to_string(got));
  }
  std::cout<<"PASS WS INT32 accumulator trial "<<trial<<"\n";
  // A second K tile accumulates onto the existing result (K=32).
  s.cmd(6,shape(16),shape(0xc0000000u | accrow));
  s.cmd(4,shape(0),shape(0xffffffffu));
  s.cmd(3,0x7000,shape(0xa0000000u | accrow));s.drain();
  for(int i=0;i<256;i++){
   int32_t got;std::memcpy(&got,&s.mem[0x7000+4*i],4);
   if(got!=full[i]*2)throw std::runtime_error("K=32 accumulation mismatch");
  }
  std::cout<<"PASS WS K=32 two-tile accumulation trial "<<trial<<"\n";
 }
 }catch(const std::exception&e){std::cerr<<"FAIL "<<e.what()<<"\n";return 1;}
}
