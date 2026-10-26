#!/usr/bin/env python3
"""Independent signed INT8 maxpool reference for pdp_8x8x64_2x2_int8.
8-channel atoms; 64-byte row, 512-byte surface; 2x2 stride1, right/bottom pad1.
No DUT outputs are used to compute the expected tensor or CRC.
"""
from pathlib import Path
import re,zlib,json
b=Path(__file__).resolve().parents[1];name='pdp_8x8x64_2x2_int8'
a=bytearray(4096)
for off,n,payload in re.findall(r'offset:(0x[0-9a-f]+), size:(\d+), payload:([^}]+)',(b/'tb/traces'/name/(name+'_in.dat')).read_text()):
 data=bytes(int(x,16) for x in payload.split());assert len(data)==int(n)
 a[int(off,16):int(off,16)+len(data)]=data
pred=bytearray(4096)
for c in range(64):
 for y in range(8):
  for x in range(8):
   vals=[]
   for dy in range(2):
    for dx in range(2):
     if y+dy<8 and x+dx<8:
      v=a[c//8*512+(y+dy)*64+(x+dx)*8+c%8];vals.append(v if v<128 else v-256)
   pred[c//8*512+y*64+x*8+c%8]=max(vals,default=-128)&255
assert zlib.crc32(pred)==0x33d91a71, 'Independent reference disagrees with frozen upstream expectation'
actual=(b/'build'/name/'crc-output.bin').read_bytes()
assert len(actual)==len(pred)
mismatches=[i for i,(x,y) in enumerate(zip(pred,actual)) if x!=y]
report={'status':'pass' if not mismatches else 'fail','expected_crc':'0x33d91a71','actual_crc':hex(zlib.crc32(actual)),'bytes':len(pred),'mismatches':len(mismatches),'first_mismatches':mismatches[:16]}
(b/'build/maxpool-reference.status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report));raise SystemExit(bool(mismatches))
