#pragma once
#include <array>
#include <cstdint>
#include <algorithm>
namespace golden {
// INT8 x INT8 -> INT32. Unsigned accumulation defines modulo-2^32
// overflow explicitly. Identity-scale INT8 output saturates, no activation.
inline std::array<int32_t,256> matmul(const int8_t* a,const int8_t* b,
                                    const int32_t* bias=nullptr) {
 std::array<int32_t,256> out{};
 for(int i=0;i<16;i++)for(int j=0;j<16;j++){
  uint32_t sum=bias?uint32_t(bias[i*16+j]):0;
  for(int k=0;k<16;k++)sum+=uint32_t(int32_t(a[i*16+k])*int32_t(b[k*16+j]));
  out[i*16+j]=int32_t(sum);
 }
 return out;
}
inline int8_t saturate(int32_t x){return int8_t(std::max(-128,std::min(127,x)));}
}
