# VectorCGRA frozen Verilog (可综合网表源 + 冒烟记录)

本目录冻结由 VectorCGRA 生成器产出的可综合 Verilog，以及重新生成它们
所需的全部命令/脚本。文件一经冻结不再改动（SHA256 见 SHA256SUMS）。

## Provenance（来源）

- 仓库: https://github.com/tancheng/VectorCGRA
- 克隆位置: third_party/vectorcgra
- commit: `20ea53bfd54980acf5bc6eef4b0959a710a4dd1f`
  (Merge pull request #340 from tancheng/fix/issue339-gemv, 2026-09-27)
- submodules（随主 commit 冻结）:
  - fu/fused_alu_fixedp/dp_fpfma @ 42f72d60ae37d6c33e81951ca87e7769d6fc4879
  - fu/pymtl3_hardfloat @ aea69e416e079178df4bb5697795ef653f55df58
  - noc/PyOCN @ d8ffacc64fb8dd24ce26e944d501016880302bbe
- 许可证: BSD-3-Clause
- 生成环境:
  - Python 3.10.0 (系统 python3)
  - pymtl3 3.1.13 —— fork `tancheng/pymtl3.1@yo-struct-list-fix`
    (pip --user 安装；deps: py==1.11.0, hypothesis, pytest 9.0.3, cffi, greenlet)
  - sv2v v0.0.10-0-g87642c0 (GitHub Release 预编译二进制;
    v0.0.13 需要 GLIBC>=2.32, 本机 2.31, 故用 v0.0.10)
  - Yosys 0.61+0 (git sha1 77005b69a) —— third_party/taiwei-tools/yosys/yosys

## 冻结的配置

两份配置，均取自上游 cgra/test/CgraRTL_test.py 中的现成用例（不改设计源码）：

| 配置 | 上游测试名 | 阵列 | 拓扑 | data 位宽 | FU 列表 |
|------|-----------|------|------|-----------|---------|
| 2x2  | test_homogeneous_2x2_ctrl_count_2 | 2x2 | Mesh | 32 | Adder, Mul, Logic, Shifter, Phi, Comp, Grant, MemUnit, Sel, Ret（标量） |
| 4x4  | test_vector_mesh_4x4 | 4x4 | Mesh | 32 | 上表去掉 Ret 加 VectorMulCombo, VectorAdderCombo（向量） |

其余参数沿用 init_param 默认：ctrl_mem_size=6, data_mem_size_global=128,
data_mem_size_per_bank=16, num_banks_per_cgra=2, num_registers_per_reg_bank=16,
num_fu_inports=4, num_fu_outports=2, tile 端口数 4 (Mesh)。

顶层模块名:
- 2x2: `CgraRTL__ee448ce8f855514e`
- 4x4: `CgraRTL__22d0a224865d9838`

## 文件清单

| 文件 | 说明 |
|------|------|
| CgraMesh2x2_homogeneous__verilog.v | PyMTL3 stock Verilog 后端原始输出（SystemVerilog: typedef struct packed + unpacked-array 端口；Verilator 可用，Yosys 前端不可直接读） |
| CgraMesh2x2_homogeneous__sv2v.v | 经 sv2v 转换后的 Verilog-2005（Yosys 直接可读可综合；综合冒烟用的就是它） |
| CgraMesh4x4_vector__verilog.v / __sv2v.v | 同上，4x4 向量配置 |
| gen_verilog.py | translate-only 生成脚本（含 Yosys 后端 brace-bug 补丁与 bool 字面量修正，见脚本内注释） |
| yosys_smoke.ys | Yosys 综合冒烟脚本模板（顺序仿上游 mflowgen: synth → flatten → setundef → dfflibmap → abc → stat） |
| run_2x2.ys / run_4x4.ys | 实例化后的脚本 |
| logs/ | sv2v 与 Yosys 运行日志 |
| SHA256SUMS | 冻结 .v 的校验和 |

## 重新生成（复现）

```bash
cd /home/shen/Desktop/project/3D-Bench/third_party/vectorcgra
git checkout 20ea53bfd54980acf5bc6eef4b0959a710a4dd1f
git submodule update --init

# 依赖（一次性，全部 --user，不 sudo）
pip3 install --user py==1.11.0 hypothesis py-markdown-table
pip3 install --user --no-deps git+https://github.com/tancheng/pymtl3.1@yo-struct-list-fix

# 生成（translate-only，不依赖 Verilator 版本）
mkdir -p build && cd build
taskset -c 0-31 nice -n 10 python3 gen_verilog.py 2x2 verilog
taskset -c 0-31 nice -n 10 python3 gen_verilog.py 4x4 verilog

# sv2v 转换（Yosys 前端可读形式）
taskset -c 0-31 nice -n 10 tools/sv2v-0.0.10/sv2v CgraMesh2x2_homogeneous__verilog.v > CgraMesh2x2_homogeneous__sv2v.v
taskset -c 0-31 nice -n 10 tools/sv2v-0.0.10/sv2v CgraMesh4x4_vector__verilog.v > CgraMesh4x4_vector__sv2v.v

# Yosys 综合冒烟
LIB=/home/shen/Desktop/project/3D-Bench/third_party/TaiWei/TaiWei-Pin-3D/platforms/asap7_nangate45/lib/NangateOpenCellLibrary_typical.processed.lib
taskset -c 0-31 nice -n 10 /home/shen/Desktop/project/3D-Bench/third_party/taiwei-tools/yosys/yosys -s run_2x2.ys | tee yosys_2x2.log
```

注：gen_verilog.py 从 build/ 目录运行；sv2v 二进制在 build/tools/sv2v-0.0.10/。

## 综合冒烟结果（Yosys 0.61 + Nangate45 typical, abc 映射）

| 配置 | cells | 面积 (µm²) | 时序占比 | DFF | 峰值内存 | 耗时 |
|------|-------|-----------|----------|-----|----------|------|
| 2x2 homogeneous | 590,237 | 742,336.3 | 29.9% | 49,078 (DFF_X1) | 2.28 GB | ~12 min |
| 4x4 vector | 2,006,824 | 2,477,311.5 | 27.6% | 151,293 (DFF_X1) | 6.79 GB | ~55 min (abc 占 51 min) |

完整 stat 与 abc 输出见 logs/yosys_2x2_sv2v_smoke.log 与
logs/yosys_4x4_sv2v_smoke.log（各自日志末尾 "Printing statistics" 一节）。
