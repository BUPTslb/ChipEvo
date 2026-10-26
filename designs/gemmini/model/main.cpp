#include "golden.hpp"
#include <iostream>
// stdin: 256 signed INT8 A entries, then 256 signed INT8 B entries.
// stdout: 16 rows of INT32 reference results. No instruction/cycle model.
int main(){
 std::array<int8_t,256>a{},b{};
 for(auto*p:{&a,&b})for(auto&x:*p){
  int v;if(!(std::cin>>v)||v< -128||v>127){std::cerr<<"Expected 512 INT8 values\n";return 1;}
  x=int8_t(v);
 }
 auto c=golden::matmul(a.data(),b.data());
 for(int i=0;i<256;i++)std::cout<<c[i]<<(i%16==15?'\n':' ');
}
