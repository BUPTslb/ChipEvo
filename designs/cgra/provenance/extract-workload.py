from pathlib import Path
import sys,json,xml.etree.ElementTree as ET
sys.path.insert(0,'/home/shen/Desktop/project/3D-Bench/third_party')
import vectorcgra.cgra.test.CgraRTL_test as t
b=Path('/home/shen/Desktop/project/ChipEvo/chips/cgra')
th=t.init_param('Mesh',[t.AdderRTL,t.MulRTL,t.LogicRTL,t.ShifterRTL,t.PhiRTL,t.CompRTL,t.GrantRTL,t.MemUnitRTL,t.SelRTL,t.RetRTL],total_execute_ctrl_count=2);th.elaborate()
src=th.src_ctrl_pkt._dsl.args[1];qry=th.src_query_pkt._dsl.args[1];exp=th.complete_signal_sink_out._dsl.args[1];T=type(exp[0]);P=T.get_field_type('payload')
def off(T,k):
 fields=list(T.__bitstruct_fields__.items());return sum(v.nbits for n,v in fields[ [n for n,v in fields].index(k)+1:])
mask=(((1<<P.get_field_type('cmd').nbits)-1)<<off(P,'cmd'))|(((1<<P.get_field_type('data').nbits)-1)<<off(P,'data'))
mask<<=off(T,'payload');words=(T.nbits+31)//32
meta={'source_test':'test_homogeneous_2x2_ctrl_count_2','packet_bits':T.nbits,'source':[hex(int(x.to_bits())) for x in src],'query':[hex(int(x.to_bits())) for x in qry],'expected':[hex(int(x.to_bits())) for x in exp],'compare_mask':hex(mask),'required_completions':sum(int(x.payload.cmd==t.CMD_COMPLETE) for x in exp)}
(b/'tb/mesh2x2-workload.json').write_text(json.dumps(meta,indent=2)+'\n')
def array(name,values):return f'const uint32_t {name}[][W]={{'+','.join('{'+','.join(str((v>>(32*i))&0xffffffff)+'u' for i in range(words))+'}' for v in values)+'};\n'
s='#include "Vdut.h"\n#include "verilated.h"\n#include <cstdint>\n#include <cstdio>\n#include <algorithm>\nconstexpr int W='+str(words)+';\n'
s+=array('src',[int(x.to_bits()) for x in src])+array('qry',[int(x.to_bits()) for x in qry])+array('expected',[int(x.to_bits()) for x in exp])+array('mask',[mask])
s+='int main(int argc,char**argv){Verilated::commandArgs(argc,argv); Vdut d;\n'
tree=ET.parse(b/'build/closure.xml');types={v.get('id'):v for v in tree.findall('.//typetable/*')}
for v in tree.find('.//module[@topModule="1"]').findall('var'):
 if v.get('dir')!='input':continue
 n=v.get('origName',v.get('name'));ty=types[v.get('dtype_id')];w=abs(int(ty.get('left','0'))-int(ty.get('right','0')))+1
 s+=f'd.{n}=0;\n' if w<=64 else f'for(int j=0;j<{(w+31)//32};j++) d.{n}[j]=0;\n'
s+='d.address_upper=31; int si=0,qi=0,ei=0;\nfor(int cycle=0;cycle<10000;cycle++){d.clk=0; d.reset=cycle<4; d.send_to_cpu_pkt__rdy=1; d.recv_from_cpu_pkt__val=0;\n'
s+=f'bool query=si=={len(src)} && ei>={meta["required_completions"]};\nif(!d.reset){{if(si<{len(src)}){{d.recv_from_cpu_pkt__val=1;std::copy(src[si],src[si]+W,&d.recv_from_cpu_pkt__msg[0]);}}else if(query && qi<{len(qry)}){{d.recv_from_cpu_pkt__val=1;std::copy(qry[qi],qry[qi]+W,&d.recv_from_cpu_pkt__msg[0]);}}}}\n'
s+='d.eval(); bool take=!d.reset && d.recv_from_cpu_pkt__val && d.recv_from_cpu_pkt__rdy;\nif(!d.reset && d.send_to_cpu_pkt__val){\n'
s+=f'if(ei>={len(exp)})return 2;\n'
s+='for(int w=0;w<W;w++) if((d.send_to_cpu_pkt__msg[w]&mask[0][w])!=(expected[ei][w]&mask[0][w])){printf("MISMATCH packet %d word %d actual %x expected %x\\n",ei,w,d.send_to_cpu_pkt__msg[w],expected[ei][w]);return 3;} ei++;}\n'
s+=f'd.clk=1; d.eval(); if(take){{if(query)qi++;else si++;}} if(si=={len(src)} && qi=={len(qry)} && ei=={len(exp)}){{printf("PASS upstream mesh workload: %d responses, %d cycles\\n",ei,cycle);return 0;}}}} printf("TIMEOUT si=%d qi=%d ei=%d\\n",si,qi,ei);return 4;}}\n'
import re
s=re.sub(r'd\.(\w+)',lambda m:'d.'+m[1].replace('__','___05F') if '___05F' not in m[1] else m[0],s)
(b/'tb/mesh2x2-workload.cpp').write_text(s)
print('packets',len(src),len(qry),len(exp),'bits',T.nbits)
