#include "Vdut.h"
#include "verilated.h"
#include <cstdint>
#include <cstdio>
#include <algorithm>
constexpr int W=7;
const uint32_t src[][W]={{0u,0u,0u,0u,512u,1792u,0u},{0u,0u,0u,0u,256u,2048u,0u},{8388864u,0u,8u,25167872u,0u,768u,0u},{0u,0u,0u,8388608u,0u,0u,0u},{0u,0u,0u,0u,512u,1792u,2u},{0u,0u,0u,0u,256u,2048u,2u},{8388864u,0u,8u,25167872u,0u,768u,2u},{0u,0u,0u,8388608u,0u,0u,2u},{0u,0u,0u,0u,512u,1792u,4u},{0u,0u,0u,0u,256u,2048u,4u},{8388864u,0u,8u,25167872u,0u,768u,4u},{0u,0u,0u,8388608u,0u,0u,4u},{0u,0u,0u,0u,512u,1792u,6u},{0u,0u,0u,0u,256u,2048u,6u},{8388864u,0u,8u,25167872u,0u,768u,6u},{0u,0u,0u,8388608u,0u,0u,6u}};
const uint32_t qry[][W]={};
const uint32_t expected[][W]={{0u,0u,0u,0u,0u,3584u,8u},{0u,0u,0u,0u,0u,3584u,24u},{0u,0u,0u,0u,0u,3584u,40u},{0u,0u,0u,0u,0u,3584u,56u}};
const uint32_t mask[][W]={{0u,0u,0u,0u,4294967264u,16383u,0u}};
int main(int argc,char**argv){Verilated::commandArgs(argc,argv); Vdut d;
d.address_lower=0;
d.address_upper=0;
d.cgra_id=0;
d.clk=0;
d.reset=0;
for(int j=0;j<3;j++) d.recv_data_on_boundary_east___05Fmsg[j]=0;
d.recv_data_on_boundary_east___05Fval=0;
for(int j=0;j<3;j++) d.recv_data_on_boundary_north___05Fmsg[j]=0;
d.recv_data_on_boundary_north___05Fval=0;
for(int j=0;j<3;j++) d.recv_data_on_boundary_south___05Fmsg[j]=0;
d.recv_data_on_boundary_south___05Fval=0;
for(int j=0;j<3;j++) d.recv_data_on_boundary_west___05Fmsg[j]=0;
d.recv_data_on_boundary_west___05Fval=0;
for(int j=0;j<7;j++) d.recv_from_cpu_pkt___05Fmsg[j]=0;
d.recv_from_cpu_pkt___05Fval=0;
for(int j=0;j<7;j++) d.recv_from_inter_cgra_noc___05Fmsg[j]=0;
d.recv_from_inter_cgra_noc___05Fval=0;
d.send_data_on_boundary_east___05Frdy=0;
d.send_data_on_boundary_north___05Frdy=0;
d.send_data_on_boundary_south___05Frdy=0;
d.send_data_on_boundary_west___05Frdy=0;
d.send_to_cpu_pkt___05Frdy=0;
d.send_to_inter_cgra_noc___05Frdy=0;
d.address_upper=31; int si=0,qi=0,ei=0;
for(int cycle=0;cycle<10000;cycle++){d.clk=0; d.reset=cycle<4; d.send_to_cpu_pkt___05Frdy=1; d.recv_from_cpu_pkt___05Fval=0;
bool query=si==16 && ei>=4;
if(!d.reset){if(si<16){d.recv_from_cpu_pkt___05Fval=1;std::copy(src[si],src[si]+W,&d.recv_from_cpu_pkt___05Fmsg[0]);}else if(query && qi<0){d.recv_from_cpu_pkt___05Fval=1;std::copy(qry[qi],qry[qi]+W,&d.recv_from_cpu_pkt___05Fmsg[0]);}}
d.eval(); bool take=!d.reset && d.recv_from_cpu_pkt___05Fval && d.recv_from_cpu_pkt___05Frdy;
if(!d.reset && d.send_to_cpu_pkt___05Fval){
if(ei>=4)return 2;
for(int w=0;w<W;w++) if((d.send_to_cpu_pkt___05Fmsg[w]&mask[0][w])!=(expected[ei][w]&mask[0][w])){printf("MISMATCH packet %d word %d actual %x expected %x\n",ei,w,d.send_to_cpu_pkt___05Fmsg[w],expected[ei][w]);return 3;} ei++;}
d.clk=1; d.eval(); if(take){if(query)qi++;else si++;} if(si==16 && qi==0 && ei==4){printf("PASS upstream mesh workload: %d responses, %d cycles\n",ei,cycle);return 0;}} printf("TIMEOUT si=%d qi=%d ei=%d\n",si,qi,ei);return 4;}
