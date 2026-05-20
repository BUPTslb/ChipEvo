# ChipEvo 候选项目评估报告

## 1. 课题目标与硬约束

我们希望用 LLM 进化 **整个 RTL 工程**（而不是像现有工作那样只进化单个 `.v` 文件）。为了让"整工程进化"在第一阶段可行，候选项目必须同时满足下列硬约束：


| 编号  | 硬约束                                   | 说明                                                                                                                                                                               |
| --- | ------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| H1  | 工程规模适中                                | 优先 CPU Core / 单一 NPU 加速器，避免一开始就上完整 SoC。                                                                                                                                          |
| H2  | **具备完备的等价验证手段（最低强度策略）**               | 进化前 vs. 进化后的 RTL 必须能被工程化地判定"功能是否一致"。**已确认采用最低强度策略：L1 / L2 / L3 任一命中即视为通过 H2**。理由：即便项目只有 L3 回归，我们仍可以用 **Synopsys Formality** 对"非功能性改写"做 L1 兜底；对"micro-arch 改写"则用 L3 覆盖率作为置信度上界即可。 |
| H3  | RTL 仿真原生支持 Synopsys **VCS**           | 我们只有 VCS + DC 这一条 Synopsys 工具链，不打算替换。                                                                                                                                            |
| H4  | 逻辑综合原生支持 Synopsys **Design Compiler** | 同 H3，仓库自带 DC 脚本最佳。                                                                                                                                                               |
| H5  | 验证流程完备                                | 至少有 testbench + regression，越接近 industrial DV 越好。（与 H2 互补：H2 关注"能不能判等价"，H5 关注"测试集本身覆盖如何"。）                                                                                        |
| H6  | PPA 评估流程完备                            | 至少能给出 area / timing / power 的可复现脚本。                                                                                                                                              |


### 1.1 H2 的三层等价验证手段（用于评分细化）

LLM 进化的"功能一致"判定，按强度从严到松可分三层，**每个项目至少落在其中一层即视为命中 H2**：


| 层级           | 形式                                                   | 典型工具                                                | 能容忍的进化范围                             | 备注                              |
| ------------ | ---------------------------------------------------- | --------------------------------------------------- | ------------------------------------ | ------------------------------- |
| L1 严格等价      | RTL ↔ RTL 形式等价 (LEC)                                 | **Synopsys Formality**、Yosys EQY                    | 仅非功能性改写（重命名、recoding、流水线 retiming 等） | 与 VCS+DC 工具链同生态，几乎零额外成本         |
| L2 接口/ISA 等价 | 通过 ISA 参考模型 / cycle-accurate 模型做 diff，或上层接口 trace 比对 | 项目自带 ISS（MINISA、Whisper、OTBNSim、cmod）、Spike、Imperas | 容忍 micro-arch 变化（流水线深度、分支预测器、调度器等）   | LLM 改 micro-arch 但保持 ISA/接口是这一层 |
| L3 测试集覆盖     | 跑完整 self-checking 回归，看通过率与覆盖率                        | UVM + functional coverage、riscv-arch-test、合规套件      | 任意改动，但只能"以覆盖率为上界"做置信判断               | 当 L1/L2 都不可用时的兜底                |


> **进化粒度提醒**：本课题侧重 Core/Accelerator 级的整工程进化，避免一开始就尝试整 SoC（OpenTitan 整 chip / CORE-V MCU 整 SoC 等不适合作为第一目标，但其子模块可单独取出）。

## 2. 评估维度速查表

下表给出 8 个候选项目对 6 条硬约束的命中情况。✓ = 满足，△ = 部分满足，✗ = 不满足。


| #   | 项目                           | 类型                  | HDL     | H1 规模           | H2 等价验证手段（L1/L2/L3）                                                                     | H3 原生 VCS                                | H4 原生 DC                             | H5 验证流程                          | H6 PPA 流程                 | 综合判定                           |
| --- | ---------------------------- | ------------------- | ------- | --------------- | --------------------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------ | -------------------------------- | ------------------------- | ------------------------------ |
| 1   | FEATHER                      | NPU                 | Verilog | ✓ 小-中           | ✓ **L2** MINISA 两级 (ISA + cycle) + L1 Formality                                         | △ Verilog 兼容，无脚本                         | ✓ DC + Innovus 脚本                    | △ 两层 ISA/cycle 检查                | ✓ pre-run 面积/功耗表          | **一梯队**                        |
| 2   | NVDLA                        | NPU                 | Verilog | △ 大             | ✓ **L2** `cmod/` C-model + L3 `verif/synth_tb`                                          | △ Verilog 兼容，无脚本                         | ✓ `syn/scripts/dc_run.tcl` + 5 个 SDC | △ `verif/verilator` + `synth_tb` | ✓ syn/perf 目录完备           | **二梯队（不维护）**                   |
| 3   | VeeR EH1                     | RISC-V Core         | SV      | ✓ 中             | ✓ **L2** Whisper ISS + L3 riscv-tests/CoreMark                                          | ✓ Makefile 有 VCS target                  | △ 综合友好，无现成脚本                         | ✓ riscv-tests + co-sim           | △ 需自行接 DC                 | **一梯队**                        |
| 4   | OpenHW CV32E40P              | RISC-V Core         | SV      | ✓ 小-中           | ✓ **L2 + L3** core-v-verif（Spike/Imperas diff + UVM 覆盖签核）                               | ✓ core-v-verif 支持 VCS/Xcelium/Questa     | △ 综合友好，仓库内无 DC 脚本                    | ✓ core-v-verif UVM               | △ 无 ASIC PPA 默认流程         | **一梯队**                        |
| 5   | OpenHW CV32E20 / E40S / E40X | RISC-V Core         | SV      | ✓ 小             | ✓ 同上（共用 core-v-verif）                                                                   | ✓ 同上                                     | △ 同上                                 | ✓ 同上                             | △ 同上                      | **一/二梯队**（与 4 对照）              |
| 6   | OpenHW CVA6                  | RISC-V Core         | SV      | ✗ 大（64-bit 应用级） | ✓ L2 Spike + RVFI-DII + L3 UVM                                                          | ✓                                        | △                                    | ✓                                | △                         | **暂缓（仅 H1 不命中）**               |
| 7   | OpenTitan (整 chip)           | SoC                 | SV      | ✗ 全 SoC         | ✓ **L1+L2+L3** OTBNSim / ibex_simple_system / FPV                                       | ✓ dvsim 主流                               | ✓ lowRISC 综合脚本                       | ✓ 最完备 DV+FPV                     | △ 公开 PPA 偏弱               | **整 chip 暂缓；子块 OTBN/Ibex 一梯队** |
| 8   | Coral NPU                    | NPU                 | SV      | ✓ 中             | ✓ **L2** MPACT-Sim + L3 cocotb 回归                                                       | △ 主推 Verilator/cocotb                    | △ 综合可行，文档少                           | ✓ Bazel + cocotb                 | △ 无开源 PPA 套件              | **二梯队**                        |
| 9   | SCR1                         | RISC-V Core         | SV      | ✓ 小             | △ **L3 only**：riscv-tests + 内建 self-check（无 ISS diff）                                   | ✓ Makefile 有 VCS target                  | △ 综合友好，无现成脚本                         | △ riscv-tests                    | ✗ 无 PPA 脚本                | **二梯队（覆盖率有限，可做对照）**            |
| 10  | NEORV32                      | RISC-V Core + 微 SoC | VHDL    | ✓ 小             | △ **L3 only**：riscv-arch-test 合规 + `processor_check` + GHDL CI                          | △ VHDL，VCS 需 VHDL Compiler license       | △ VHDL，DC 需 VHDL license；无现成脚本       | ✓ CI + processor_check + 合规测试    | ✗ FPGA 流程为主，无 ASIC PPA 脚本 | **三梯队（VHDL 路线备选）**             |
| 11  | ZipCPU                       | 自定义 ISA RISC Core   | Verilog | ✓ 小-中           | ✓ **L1 强**：SymbiYosys formal properties (prefetch/bus/pipeline) + L3 `bench/`+Verilator | △ Verilog 兼容，主推 Verilator                | △ 无 DC 脚本                            | ✓ formal + sim                   | ✗ FPGA 为主，无 ASIC PPA      | **二梯队（L1-driven 样板）**          |
| 12  | Hummingbirdv2 E203           | RV32IMC Core + SoC  | Verilog | ✓ 小-中           | △ **L3**：`vsim/`+`tb/` 自带 riscv-tests 风格回归（可外挂 Spike 升级为 L2）                            | ✓ `vsim/` 历史含 VCS Makefile（也支持 iVerilog） | △ 无 DC 脚本                            | ✓ tb + vsim 回归                   | ✗ FPGA 为主，无 ASIC PPA      | **二梯队（中文文档/教学 baseline）**      |
| 13  | RV12                         | RV32I/RV64I Core    | SV      | ✓ 中             | △ **L3**：`sim/ahb3lite/` + bench/（可外挂 Spike）                                            | △ ModelSim/TCL 流为主，VCS 需自适配              | △ 无 DC 脚本                            | △ sim 回归                         | ✗ 无 ASIC PPA 脚本           | **三梯队（license 受限 + 停更）**       |


## 3. 推荐梯度

基于上表，给出三档建议：

### 一梯队（建议作为首批进化目标 / H2 命中 L2 等价层）

1. **FEATHER**：规模最适中、PPA 表最干净、MINISA 提供 ISA + cycle 两级 diff，可作为 L2 等价层；非功能性改写还能再叠 Formality (L1)。**最适合作为"NPU 整工程进化"的零号实验**。
2. **VeeR EH1**：Whisper ISS 提供 L2 指令级 diff，VCS Makefile 现成，规模在 SCR1 与 BOOM 之间。**最适合作为"CPU 整工程进化"的零号实验**。
3. **OpenHW CV32E40P**：core-v-verif 是候选集里 DV 完备性最高的（L2 Spike/Imperas diff + L3 UVM functional coverage 签核），按新 H2 口径已无 caveat，正式列入一梯队。

### 二梯队（扩展实验 / 对照组 / 子块切出）

1. **NVDLA**：`cmod/` 提供 L2 C-model diff、`syn/` 提供完整 DC 脚本与 5 个 partition SDC，是最强 PPA 对照；缺点是不再维护、工作负载与 LLM 评估意图错位。
2. **OpenTitan 子块 OTBN / Ibex**：从整 chip 切出来，配 OTBNSim（L2）+ FPV（L1）+ UVM（L3）三层全有，**等价验证手段在整套候选里最强**。
3. **OpenHW CV32E20 / CV32E40S / CV32E40X**：与 CV32E40P 共享 core-v-verif，作为"同框架不同 micro-arch"对照。
4. **Coral NPU**：MPACT-Sim（L2）+ cocotb 回归（L3）完备，但工具链偏 Bazel+Verilator，对接 VCS+DC 需自写脚手架。
5. **SCR1**：在新 H2 口径下不再被剔除——它有完整的 riscv-tests + 内建 self-check + VCS Makefile，属于 **L3 only** 等价手段，覆盖率没有 core-v-verif 强，但完全够做"小核 + L3 兜底"的对照实验。
6. **ZipCPU**：候选集里**唯一在仓库内系统性使用 formal property** 的项目（SymbiYosys 覆盖 prefetch / bus / pipeline 多处）。作为 **L1-driven 进化样板**与其他靠 L2/L3 的候选形成对照。代价是非 RISC-V 自定义 ISA，没有 Spike 这条 L2，且 GPLv3 license 比 Apache 重。
7. **Hummingbirdv2 E203**：Nuclei 开源的 RV32IMC + SoC，仓库自带 `vsim/`（历史上含 VCS Makefile）和 `tb/` 回归；中文文档体系（《E203 RISC-V CPU 设计实战》）非常完整。作为 **RV32 教学/工业对照 baseline**，与 VeeR EH1（更工业）和 SCR1（更精简）形成三角对照。注意上一个 release 在 2021，维护已停滞。

### 三梯队（仅在特定 license / 环境条件下启用）

1. **NEORV32**：RISC-V VHDL 小核（替换原先误标为 RISC-V 的 NEO430），CI + riscv-arch-test + `processor_check` 给到 L3 等价手段。但**仓库内只有 FPGA 综合示例、没有 ASIC PPA 脚本**，且整条 VHDL 路线需要 VCS / DC 的 **VHDL Compiler license**。**只在学校 license 允许时**作为 VHDL 工具链路径的备选。
2. **RV12**：参数化的 RV32I/RV64I 核，6-stage 流水可挂可选 cache / BPU / MMU，从工程复杂度上很适合做"参数空间扫描"。但 **RoaLogic Non-Commercial License** 限制后续合作，且最近一次 release 在 2018-09，已停更。**仅在前面 8 个 CPU 候选都不可用时作为最后备选**。

### 暂缓 / 剔除

1. **CVA6**：64-bit 应用级核，第一阶段过大（仅 H1 不命中）。
2. **OpenTitan 整 chip / CORE-V MCU 整 SoC**：违反 H1。

## 4. 逐项详细评估

> 每个项目按统一字段呈现：定位 / 规模 / 实现语言 / 作者参考模型 / RTL 仿真 / 逻辑综合 / 验证流程 / PPA 流程 / 适配性 / 风险。
>
> "原生支持 VCS / DC" = 仓库中存在可直接调用的 VCS Makefile target 或 DC `*.tcl` / `.sdc` 脚本。

### 4.1 FEATHER — NPU （[GitHub](https://github.com/maeri-project/FEATHER/tree/main)）

- **定位**：MAERI 组的可重构 NPU，矩阵乘加速器。
- **规模**：从 4×4 PE 到 64×128 PE 可配置，最小配置面积 ~25k μm²，最大 ~37 M μm²；本课题建议先用 16×16 或 32×32。
- **实现语言**：Verilog。
- **作者参考模型**：**MINISA**（两级检查）：
  - L1：ISA trace 语义对 `numpy.matmul` 的结果一致性（功能金标）。
  - L2：trace 展开成 per-cycle config stream，与周期模型一致（cycle-accurate 检查，更靠近 RTL 控制层）。
  - 局限：**不能证明 RTL 正确**，只能证明 ISA + 周期模型自洽。
- **RTL 仿真**：仓库未提供 VCS Makefile，但 RTL 是纯 Verilog，VCS 直接 `vcs -f filelist` 即可拉起；与 `FEATHER_RTL/RTL/` 配合一两小时可写出 wrapper。
- **逻辑综合**：`FEATHER_RTL/README.md` 明确指明使用 **Synopsys Design Compiler** 综合 + **Cadence Innovus** PnR；reports 目录含 `feather_top_area.rpt` / `_power.rpt` / `_timing.rpt`。
- **PPA 流程**：README 已附 pre-run 表（不同配置的 area / power / 1 GHz timing），可直接做对照基线。
- **适配性**：✅ 最契合"NPU 整工程进化 + Synopsys 工具链"。
- **风险**：研究原型，DV 成熟度低于工业 IP；Innovus 我们没有 license，对照实验 PPA 只能停在 DC 阶段。

### 4.2 NVDLA — NPU （[GitHub](https://github.com/nvdla/hw)）

- **定位**：NVIDIA 开源深度学习加速器。
- **规模**：偏大，子模块 csc / cmac / cdp / pdp / sdp / rubik / cdma / cbuf / bdma 等十余个；建议只对其中一两个 partition 做整工程进化。
- **实现语言**：Verilog。
- **作者参考模型**：`cmod/` 下有完整 C-model；上层 `umbrella` + `sw` 提供 trace 比对。
- **RTL 仿真**：仓库内只有 `verif/verilator/Makefile` 与 `verif/sim_vivado/Makefile`，无现成 VCS Makefile；但代码本身 VCS 兼容性良好（业界普遍这么用）。
- **逻辑综合**：`syn/scripts/dc_run.tcl` + `syn/scripts/dc_app_vars.tcl` 是完整 DC reference flow，`cons/NV_NVDLA_partition_{a,c,m,o,p}.sdc` 提供五个 partition 的约束文件。
- **验证流程**：`verif/synth_tb/` 有 AXI 周边 testbench，但 trace 驱动测试要靠 NVIDIA 内部 traceplayer 框架（外部仓库不完整）。
- **PPA 流程**：`syn/` 与 `perf/` 双目录，业内最完备 NPU 综合 reference 之一。
- **适配性**：DC 流程完美命中 H4；但 H1（规模）、H5（DV 完备性）、H6（工作负载相关性）都打折。
- **风险**：
  - **2018 年后基本不维护**，HW PR 数年未合。
  - 工作负载只到 ImageNet 分类，与 LLM 评估几乎无关；适合做 PPA 对照而非进化主目标。
  - License 是 NVIDIA Open NVDLA License，非 Apache/MIT，二次分发要注意。

### 4.3 VeeR EH1 — RISC-V Core （[GitHub](https://github.com/chipsalliance/Cores-VeeR-EH1)）

- **定位**：CHIPS Alliance 维护的 32-bit RISC-V CPU IP（前 Western Digital SweRV）。
- **规模**：单核约 5 万行 SV，规模在 SCR1 之上、BOOM 之下，适合整工程进化。
- **实现语言**：SystemVerilog。
- **作者参考模型**：**Whisper ISS**（同样由 CHIPS Alliance / WD 维护），支持指令级与 RVFI 接口的 trace 对齐。
- **RTL 仿真**：`tools/Makefile` 与顶层 README 自带 `make -f tools/Makefile target=default verilator|vcs` 等 target；**VCS 是 first-class**。
- **逻辑综合**：仓库未自带 DC 脚本，但 SV 综合友好，DC 上手 < 1 周。
- **验证流程**：`testbench/` 自带 hello、CoreMark、Dhrystone 等 ISA 测试；外部接 Whisper 做 co-sim 即可形成 DiffTest 风格回归。
- **PPA 流程**：无现成 DC/Innovus 脚本，但 PPA 实验门槛低。
- **适配性**：✅ 最契合"CPU 整工程进化 + 作者参考模型 + Synopsys 工具链"。
- **风险**：Whisper 与 VeeR 的版本耦合需要核对；EH1 是 ROADMAP 上的旧版（最新为 EH2/EL2/EH3），但旧版反而更稳定，适合本课题。

### 4.4 OpenHW CV32E40P — RISC-V Core （[GitHub](https://github.com/openhwgroup/cv32e40p)）

- **定位**：OpenHW Group 主力 32-bit 嵌入式 RISC-V 核（PULP RI5CY 的工业化分支）。
- **规模**：约 15k 行 SV，比 VeeR EH1 略小。
- **实现语言**：SystemVerilog。
- **等价验证手段**：在新 H2 口径下**一梯队命中**——
  - L2：`core-v-verif` 集成了 **Spike**（开源）和 **Imperas Reference Model**（商用）做指令级 lockstep diff。
  - L3：UVM 测试平台带 functional coverage 签核 + `corev-dv`（基于 google-riscv-dv 的随机指令生成器）+ ISA compliance 套件。
  - 这两层加起来是本候选集 DV 完备性最高的之一。
- **RTL 仿真**：`core-v-verif` 同时支持 VCS / Xcelium / Questa / Verilator，VCS 是 Tier-1 验证签核环境。
- **逻辑综合**：仓库自身不带 DC 脚本，但 `cv32e40p_synthesis_wrapper.sv` 已经预留了无 SVA、无 assertion 的综合视图；接 DC 工作量小。
- **PPA 流程**：无默认 ASIC PPA 收敛流程；OpenHW 的 PPA 公开数据较少。
- **适配性**：✅ DV 维度最强，是 CV32E40P / E40S / E40X / E20 共享的工具链入口。
- **风险**：UVM 回归运行时间较长，每轮 LLM 进化的反馈延迟可能高于 VeeR EH1 + Whisper 的轻量 diff。

### 4.5 OpenHW CV32E20 / CV32E40S / CV32E40X — RISC-V Cores

- **CV32E20**：CHIPS Alliance Ibex 的 OpenHW 工业化分支，是上表中最小的核（~8k 行 SV）。
- **CV32E40S**：CV32E40P 的安全扩展版（PMP/ePMP、Smepmp）。
- **CV32E40X**：CV32E40P 的扩展接口版（CORE-V-XIF 协同处理器接口）。
- 工具链、参考模型、验证框架与 4.4 完全一致，**适合作为"同框架不同 micro-arch 的对照组"**。

### 4.6 OpenHW CVA6 — RISC-V Core

- **定位**：64-bit、5/6-stage、支持 Linux 的应用级核（前 Ariane）。
- **规模**：~50k 行 SV，远大于 CV32E40*。
- **判定**：**违反 H1**。可放到后期阶段做 scaling 实验，不作为首批进化目标。

### 4.7 OpenTitan — SoC （[GitHub](https://github.com/lowRISC/opentitan)）

- **定位**：lowRISC 维护的 Silicon Root of Trust，目标是安全启动 / 密钥管理 / 生命周期管理 / 加密加速等。
- **规模**：完整 SoC，违反 H1。**整 chip 不作为第一目标。**
- **可用子块**：
  - **OTBN**：大整数密码加速器，作者自带 **OTBNSim** Python/C 模型，是少有的"作者参考模型 + 子块 DV 完备 + 综合脚本现成"的组合，**强烈建议拆出作为单独进化目标**。
  - **Ibex**：开源 RV32IMC 小核，`ibex_simple_system` 是作者维护的最小可跑环境；与 CV32E20 同源。
- **RTL 仿真**：`dvsim.py` 是项目内统一 DV 入口，Tier-1 支持 **VCS**（也支持 Xcelium、Verilator）。
- **逻辑综合**：`hw/syn/` 下有 DC 综合脚本，但是 SoC 整体综合收敛公开度低。
- **验证流程**：本候选集中最完备：UVM DV、formal property verification、fault injection、coverage signoff 全部公开。
- **风险**：整 chip 工程量过大；如要用，必须先拆子块。

### 4.8 Coral NPU — NPU （[GitHub](https://github.com/google-coral/coralnpu)）

- **定位**：Google Coral 团队的小型 NPU + RV32 host core。
- **规模**：中等，整体 Bazel 工程，含 RTL / sim / FPGA / SW。
- **作者参考模型**：**MPACT-Sim**（Google 自研），支持 ISA + cycle-level 模型，并提供 cocotb co-simulation hook。
- **RTL 仿真**：仓库主推 **Verilator + cocotb**；VCS 可用但非默认。
- **逻辑综合**：未提供 DC 脚本；综合可行性 OK 但脚本要自写。
- **验证流程**：cocotb regression + MPACT 比对。
- **风险**：与 Synopsys 工具链耦合较弱，对接 VCS+DC 需要自己搭脚手架；适合作为"DV 风格不同的对照"。

### 4.9 SCR1 — RISC-V Core （[GitHub](https://github.com/syntacore/scr1)）

- **定位**：Syntacore 早期开源 32-bit 嵌入式核（RV32I/E + M + C）。
- **等价验证手段**：**L3 only**——
  - 仓库内置 `riscv-tests` 风格的 self-checking 测试集；
  - 提供 VCS / Modelsim / Verilator Makefile，可一键跑回归；
  - **不带 ISS lockstep**（需自行接 Spike 做 L2），也不带 functional coverage 签核。
- **RTL 仿真**：`sim/Makefile` 有 VCS target，工具链贴合度高。
- **逻辑综合**：仓库无 DC 脚本；SV 综合友好。
- **PPA 流程**：仓库不提供 ASIC area/timing/power 脚本。
- **适配性**：**新 H2 口径下不再被剔除**。SCR1 在"想要一个最小、最干净、原生 VCS 友好的 CPU 候选"维度上很好用，可作为 VeeR EH1 / CV32E40P 的对照下限。
- **风险**：
  - DV 覆盖率与 CV32E40P 不在一个级别，L3 兜底的置信度较低；
  - Syntacore 已切换到 SCR1.1 / SCR9（部分闭源），SCR1 上游基本停更，社区修复要靠自己。

### 4.10 NEORV32 — RISC-V Core + 微 SoC （[GitHub](https://github.com/stnolting/neorv32)）

- **替换背景**：原候选清单写的是 **NEO430**，但 NEO430 实际实现的是 **TI MSP430 ISA**（VHDL）、且无作者 ISS，与本课题 ISA 与 H2 均不符。同一作者把它"RISC-V 化"后另立项目就是 **NEORV32**，这里直接用 NEORV32 替换。
- **定位**：stnolting 维护的 32-bit RISC-V 软核 + 微 SoC，主要面向 FPGA 嵌入式场景，2k+ star，社区活跃。
- **规模**：CPU 本体约 1–2 万行 VHDL；带可选外设（UART、SPI、I²C、TWI、定时器、TRNG 等）。属于本候选集最小的 RISC-V 核之一。
- **实现语言**：**VHDL**（与课题主流 SV/Verilog 候选不同，是工具链兼容性最大变量）。
- **等价验证手段**：**L3 only**——
  - `**processor_check`**：跑在 NEORV32 本身上的自检程序，覆盖 CSR、异常、特权切换、外设访问等硬件特性。
  - **riscv-arch-test 合规套件**：官方 RISC-V 兼容性测试，CI 使用 **GHDL** 跑回归。
  - 没有 ISS lockstep（L2），但 L3 完备度比 SCR1 高，新 H2 口径下视为命中。
- **RTL 仿真**：官方 CI 用 **GHDL** + **GTKWave**；用 VCS 跑 VHDL 需要 **VHDL Compiler license**（与 Verilog VCS license 不同）。
- **逻辑综合**：仓库提供 **Vivado / Quartus / Lattice Radiant / Yosys+GHDL** 的 FPGA 综合示例，**没有 Design Compiler 脚本**；DC VHDL 同样需要额外 license。
- **验证流程**：CI 每次 push 跑 RTL 仿真 + riscv-arch-test + processor_check + bootloader smoke，回归脚本干净度高于 SCR1 / NEO430。
- **PPA 流程**：以 **FPGA LUT/FF/BRAM 报告** 为主，仓库没有 ASIC area/power/timing 脚本；做 ASIC PPA 需要我们自己写 DC tcl。
- **适配性**：
  - 优点：规模小、CI 强、文档质量高，**是 VHDL 路线下最稳的备选**。
  - 缺点：与课题 Synopsys VCS+DC 工具链耦合需要 VHDL license；H2 严格不命中；H6 ASIC PPA 需自建。
- **建议位置**：H2 已命中，但 H3/H4 受 VHDL license 限制、H6 缺 ASIC PPA 脚本，**仅在学校 VCS / DC 包含 VHDL Compiler license 时纳入**，作为 VHDL 路线的对照组，不进入 Exp-0 实验梯队。

### 4.11 ZipCPU — 自定义 ISA RISC Core （[GitHub](https://github.com/ZipCPU/zipcpu)）

- **定位**：Dan Gisselquist (ZipCPU.com) 维护的 32-bit RISC 小核，**自定义 ISA**（不是 RISC-V），强调形式化验证驱动的设计方法学。1.5k+ star，作者博客 zipcpu.com 持续更新。
- **规模**：CPU 本体约 1 万行 Verilog，5-stage 流水（prefetch / decode / read-operand / 合并 ALU/Mem/Div / writeback），含 supervisor/user 双模式与可选 FPU 接口。属于本候选集中规模最小、阅读最容易的 CPU 之一。
- **实现语言**：**Verilog**（与 VCS 工具链原生兼容）。
- **等价验证手段**：**L1 强 + L3**——
  - **L1 (formal)**：仓库 `bench/` 下内置 SymbiYosys formal property 文件，覆盖 prefetch、Wishbone/AXI4-Lite bus master、pipeline interlock、divider 等关键单元；作者多篇博客（"Formal Properties of a WB bus"、"Formally proving the prefetch"）专门讨论 ZipCPU 的 formal 方法学。**这是本候选集中唯一在仓库内系统性使用 formal 的项目**。
  - **L3 (sim)**：`sim/` 子目录含完整 Verilator 测试环境，`sw/` 含 GCC + newlib toolchain（作者自维护），可跑端到端程序回归。
  - 没有 L2 ISS：因为是自定义 ISA，社区不存在 Spike 等价物；但 toolchain 跑出的 reference 输出可作 "软件 golden" 用。
- **RTL 仿真**：仓库主推 **Verilator**；Verilog 与 VCS 兼容性良好，需要自己写一两个 VCS wrapper。
- **逻辑综合**：仓库无 DC 脚本；以 FPGA 为主要部署形态（参考 `ZBasic` 仓库）。
- **PPA 流程**：无 ASIC area/power/timing 脚本。
- **License**：**GPLv3**。学术/科研使用没问题，但二次分发与商业合作受限，需要明确这条边界（作者也提供商用 license 出售）。
- **适配性**：✅ 作为 **"L1-driven 进化的样板"** 价值非常独特——其他候选要么靠 L2 ISS、要么靠 L3 回归，ZipCPU 是唯一一个能让我们试验"用 formal property 当进化反馈"的项目。
- **风险**：
  - **非 RISC-V** ISA，整个 RV 生态（编译器/库/标准合规套件）不能直接复用；需要用作者的自维护 GCC port。
  - **GPLv3** 比 Apache/MIT 重，若未来要把进化产物商业化，license 边界需要法律团队过目。
  - 主推 Verilator，VCS 路径需要自适配（工作量约 1–2 天）。

### 4.12 Hummingbirdv2 E203 — RV32IMC Core + SoC （[GitHub](https://github.com/riscv-mcu/e203_hbirdv2)）

- **定位**：Nuclei System Technology 维护的开源 RV32IMC 蜂鸟核 + SoC（前身 SI-RISCV/e200_opensource）。配套有《E203 RISC-V CPU 设计实战》一书，中文文档/教学资源是本候选集中最丰富的之一。
- **规模**：CPU 本体加 SoC 外设（GPIO/I²C/UART/SPI/PWM，PULP 衍生 APB peripherals）约 3–4 万行，绝大部分 Verilog。
- **实现语言**：**Verilog**（少量 SV）。
- **等价验证手段**：**L3 主**，**L2 可外挂**——
  - L3：`tb/` + `vsim/` 自带 hex/elf 加载 testbench 与 riscv-tests 风格回归；Release 0.2.1 之后默认仿真器是 **iVerilog + GTKWave**，但 `vsim/` 历史上同时支持 VCS / NCV。
  - L2：可外挂 Spike 做 ISS lockstep，需要自写 trace 比对脚本。
  - L1：无现成 formal 流程。
- **RTL 仿真**：仓库内 `vsim/` 与 `tb/` 提供完整仿真入口，VCS Makefile 在历史 commit 中存在；近版本默认面向 iVerilog。
- **逻辑综合**：仓库无 DC 脚本，主推 **FPGA**（ddr200t / mcu200t Vivado 工程，仓库内含 `fpga/` 目录）。
- **PPA 流程**：以 **FPGA LUT/FF/BRAM 报告** 为主，无 ASIC PPA 脚本。
- **License**：**Apache-2.0**，最干净。
- **适配性**：作为 **"RV32 教学/工业对照 baseline"** 非常合适，与 VeeR EH1（更工业）、SCR1（更精简）、CV32E40P（更工业 DV）形成多角对照；且**中文文档体系完整**，对你的团队认知成本最低。
- **风险**：
  - **维护停滞**：上一个 release 在 2021-02，Nuclei 已转向商业 RISC-V IP 与 Linux-class 核（如 N300/N900），开源 E203 基本不再更新。
  - **NICE 自定义扩展**：仓库默认启用 NICE 协处理器接口，进化时要明确"是否动 NICE 路径"——这是 Nuclei 私有 ISA 扩展，进化产物如果碰到 NICE 接口的兼容性会变复杂。
  - 默认仿真器是 iVerilog，要切回 VCS 需要从历史 commit 找回旧的 Makefile（或参考 SI-RISCV/e200_opensource 的 vsim 脚本）。

### 4.13 RV12 — RV32I/RV64I Core （[GitHub](https://github.com/RoaLogic/RV12)）

- **定位**：Roa Logic 的参数化 RISC-V CPU，6-stage 单发射，目标嵌入式市场。
- **规模**：~50k 行 SystemVerilog（93%）；带可选 I/D Cache、BPU、PMP、user/super/hypervisor 模式，规模介于 SCR1 和 CV32E40P 之间，但复杂度因为可配置项而跳一档。
- **实现语言**：SystemVerilog。
- **等价验证手段**：**L3 only**——
  - L3：`bench/` + `sim/ahb3lite/` 含 ModelSim TCL + Makefile，基于 riscv-tests 风格回归。
  - L2：可外挂 Spike 做 ISS lockstep。
  - L1：无现成 formal 流程。
- **RTL 仿真**：**ModelSim 是默认环境**（TCL 脚本），VCS 需要自写 Makefile（迁移工作量 1–2 天）。
- **逻辑综合**：仓库无 DC 脚本。
- **PPA 流程**：无 ASIC PPA 脚本。
- **License**：**RoaLogic Non-Commercial License**。学术与个人研究允许，但**禁止商业用途**，且 license 文本相对冷门，二次合作/发表前需要法律核对。
- **适配性**：参数化设计（XLEN / cache size / BPU bits / replacement algorithm 等）天然适合做"参数空间扫描"，是少数能在同一份 RTL 上跑出多种 micro-arch 配置的 RISC-V 核。
- **风险**：
  - **License 风险**：非商用条款是本候选集里最严格的，**是否纳入需要你与法律/校方先确认**。
  - **维护停滞**：最近 release v1.3 在 **2018-09**，近 7 年无新版本；GitHub 上仍有 issue/PR 但 RoaLogic 响应很慢。
  - 6-stage + 可选 cache/BPU/MMU，进化反馈信号在不同配置下会跳变，需要先固定一份配置再进化。
- **建议位置**：**仅作为三梯队最后备选**，在 VeeR / CV32E40P / SCR1 / Hummingbird / ZipCPU 都不能用时再启用。

## 5. 与原稿描述的校准点汇总

| #   | 原稿表述                          | 校准                                                                                                                                 |
| --- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 1   | "NEO430 是 RISC-V 处理器核"        | **错误**。NEO430 是 MSP430 ISA，VHDL。已替换为同一作者的 **NEORV32**（RISC-V，VHDL），见 §4.10；NEORV32 仍无作者 ISS，验证靠 processor_check + riscv-arch-test。 |
| 2   | "CVA6 面向低功耗 MCU/SoC"          | **错误**。CVA6 是 64-bit Linux-class 应用核（原 Ariane）。低功耗 MCU 描述应放到 CV32E40P/S/X、CV32E20 上。                                               |
| 3   | "OpenTitan 支持 verilator 仿真"   | 不完整。OpenTitan 官方 DV 主入口是 `dvsim.py`，Tier-1 仿真器是 **VCS / Xcelium**；Verilator 只用于轻量 top-level smoke。                                 |
| 4   | "NVDLA 工具：支持 VCS、DC"          | 部分正确。**DC 完整有脚本**（`syn/scripts/dc_run.tcl` + 5 个 partition SDC）；**VCS 仓库内无 Makefile**，需要自己写 wrapper（Verilog 兼容性没问题）。               |
| 5   | "OpenHW CPU Core 有参考模型"       | 措辞需精确：作者不维护自研 ISS，但 `core-v-verif` 工程化集成了 Spike（开源）/ Imperas（商用），按"等价验证手段（L2 + L3）"口径已**完全命中 H2**。                                 |
| 6   | "FEATHER 仿真流程很完整"             | 部分正确。MINISA 提供 ISA + cycle 两层检查，但**不能证明 RTL 正确**；RTL 一致性需要我们自己接 VCS 做比对。                                                           |
| 7   | "VeeR EH1 实现语言 SystemVerilog" | 正确。再补充：作者参考模型是 **Whisper ISS**（同生态），且 `tools/Makefile` 自带 VCS target，是 H3 严格命中项。                                                   |
| 8   | "SCR1 没有参考模型模拟器"              | 事实正确，但**结论已更新**：新的 H2 不再要求作者参考模型，只要求完备等价验证手段。SCR1 命中 L3（riscv-tests + VCS Makefile），从"剔除"改为"二梯队对照"。                                |
| 9   | 全文 "实验语言"                     | 应统一为 **实现语言（HDL）**。                                                                                                                |
| 10  | 早期版本曾把 **VexRiscv** 纳入二梯队     | **已剔除**。VexRiscv 仓库内**没有任何 .v / .sv 文件**，RTL 由 SpinalHDL/Scala 经 `sbt runMain` 现场生成，属 build artifact 而非源代码；与"进化整个 RTL 工程"的设定不符。同样的理由也适用于 Chisel 生成的 Rocket / BOOM / Gemmini，本课题首批实验均不纳入。 |


## 6. 整工程进化的组合性分析：单文件 SEC 能否推出 IP 等价？

> 背景问题：现有 RTL 优化工作基本都是针对单个 .v 文件（已见最大约 4615 行 / 5 modules），流程是「LLM 改 RTL → **Cadence JasperGold SEC** 等价验证 → **DC** 综合签核 PPA」。本课题选的 IP 都是多文件 IP（NVDLA partition 几十个 .v、CV32E40P 上百个文件），**逐文件套用上述流程是否就等价于"整个 IP 被正确优化"？**

### 6.1 SEC 工具家族与能力边界（先校准术语）

| 名称                 | 能力                                      | 能容忍的进化范围                                                                  | 在我们工具链里的对应 |
| ------------------ | --------------------------------------- | ------------------------------------------------------------------------- | ---------- |
| **CEC**（组合等价）      | 给定相同寄存器边界，证明组合逻辑等价                      | 重命名、常量折叠、布尔代数化简、复制传播、resource sharing 但寄存器位置不动                           | **Synopsys Formality** |
| **SEC**（时序等价）      | 允许寄存器边界变化，证明对外可观测行为等价                   | 寄存器重定时（retiming）、FSM 重编码、pipeline 重新切分、状态压缩                               | **Cadence JasperGold SEC**、Synopsys VC Formal SEQ |
| **k-step SEC**     | 允许有限步内行为不一致（瞬态差异容忍）                     | 复位序列差异、初始状态差异                                                             | JasperGold SEC + `-k_max` |
| **Refinement**     | 证明 DUT 是 spec 的 refinement（spec 可以非确定性） | 接口协议合规性，常用于 protocol/bus 验证                                                | JasperGold FPV apps |

**关键事实**：参考工作里说的 "JasperGold SEC" 通常指**第二类（时序等价）**——它比 CEC 强很多，**正是 LLM 进化想要的能力**（允许 LLM 动寄存器、改 FSM 编码）。但它的设置成本也高得多：要给状态映射、定义 cutpoint、声明 admissible delay 等。

### 6.2 组合性定理：什么时候"模块逐个等价"能推出"IP 整体等价"？

**严格表述**（informal）：若有 IP = compose(M₁, M₂, ..., Mₙ)，进化后 IP' = compose(M₁', M₂', ..., Mₙ')，则**「∀i. Mᵢ ≡ Mᵢ' ⇒ IP ≡ IP'」**成立当且仅当**以下 5 个条件全部满足**：

| 编号 | 条件 | 直观解释 |
| --- | --- | --- |
| **C1** | 端口位宽与连线拓扑完全不变 | LLM 不能改模块端口签名、不能新增/删除模块 |
| **C2** | 端口语义（含每根线的"读取/写入时刻含义"）不变 | 即模块对外是 **bit-cycle-accurate equivalent**，不允许 admissible delay |
| **C3** | 模块之间没有隐式时序耦合 | 没有"下游会在 N 拍内拿走 valid"之类的握手约定被破坏 |
| **C4** | 不存在跨模块的共享状态（共享时钟域 / 同步原语除外） | 模块之间只通过显式端口交互 |
| **C5** | SEC 在每个 Mᵢ 处证明的是 **strict equivalence**，不是 k-step 或带 delay 的弱化版本 | k-step 与 delay 不可组合（合成后误差累加） |

**违反任一条件，组合性就垮**。下面给四个典型坍塌场景：

| 坍塌模式 | 发生场景 | 在我们候选 IP 里的位置 |
| --- | --- | --- |
| **Latency drift 累加** | LLM 在 M₁ 里 retiming，多挂了一拍输出；SEC 用 admissible delay 通过；但 M₂ 假设 M₁ 当拍给数据 | NVDLA 各 partition 之间的 AXI/CSB 握手、CV32E40P 的 forwarding 路径 |
| **协议状态错位** | LLM 在 M₁ 里改了 FSM 编码，valid/ready 含义变了 | OpenTitan 子块之间的 TileLink、FEATHER 的 reconfig stream |
| **跨模块假设泄露** | M₁ 的 reset 序列其实被 M₂ 依赖（M₂ 在 reset 后 3 拍预期某信号为 0） | CPU 启动流程几乎都有这种隐式依赖 |
| **状态映射不存在** | LLM 把 M₁ 内部 64 个 FF 压缩成 48 个；SEC 在 M₁ 处需要给出寄存器对应关系，但内部 FF 不可见于端口，无法证明 | 任何含内部计数器/缓冲的设计 |

### 6.3 现有单文件工作 vs 多文件 IP 的本质差异

参考工作里 "4615 行 / 5 module / 一个 .v 文件" 是什么？通常是：

- **单个 NPU 加速核** / **单个 datapath unit**（如 FFT、AES、矩阵乘子模块）；
- **自包含设计**：5 个 module 是顶层 + 4 个内部子模块，**端口只有顶层那一层**；
- 这种情况下 "整文件 = 整模块 = 整 IP"，**file-by-file 退化为 IP-level**，C1–C5 自然满足；
- JasperGold SEC 直接在顶层证 DUT ≡ ref，没有组合性论证的必要。

我们要做的多文件 IP（NVDLA 的 SDP partition、CV32E40P、OpenTitan OTBN 等）**根本不是这种结构**：

| 维度 | 参考工作的 4615-line 单文件设计 | 我们的多文件 IP |
| --- | --- | --- |
| 模块边界  | 一个对外，其余内部 | 几十个有意义对外接口（AXI、TileLink、CSB、流式 ready/valid） |
| FSM 跨度 | 通常全在一个文件内      | 跨多个文件协同 |
| 状态总量 | $10^2 \sim 10^3$ FF | $10^4 \sim 10^5$ FF（CPU）/ $10^4 \sim 10^6$（NPU） |
| SEC 求解时间 | 分钟级 | 单模块小时级，IP 顶层可能不收敛 |
| 优化空间 | 局部 retiming / 算子重组    | **大头在 cross-module**（共享 ALU、协议简化、buffer 合并） |

**结论**：把单文件方法直接平移到多文件 IP，不仅 C1–C5 不再自然满足，**还会把最大的优化收益（跨模块）拒之门外**——这恰恰违背"整工程进化"的初衷。

### 6.4 三种可行策略（按优化能力递增）

| 策略 | 等价手段 | 优化粒度 | 优化能力 | 工程成本 |
| --- | --- | --- | --- | --- |
| **S1: 接口冻结 + 逐模块 SEC** | L1：JasperGold SEC at module 边界 | 模块内 | **低**：只能 retiming-class | 低，但前提是 LLM 严格遵守端口冻结 |
| **S2: 层次化 SEC + 黑盒抽象** | L1：底层模块 SEC，上层用 SEC + 假设 + cutpoint | 多模块（自底向上） | 中：可以做模块组优化 | 中-高：每层都要写 SEC 设置 |
| **S3: 系统级参考模型驱动** | L2/L3：ISS / cmod / UVM coverage + LEC 作为"语法层兜底" | 整个 IP | **高**：可跨模块、改协议、改 micro-arch | 中：需要 IP 自带或外挂参考模型 |

**对应到本报告的 H2 三层框架**：

- S1 ≈ "**L1-only**" 策略（ZipCPU 的 formal-driven 路径就是这个）；
- S2 ≈ "**L1 + L3**" 策略，需要分层设置；
- S3 ≈ "**L2 + L3** + L1 兜底" 策略——**这是真正区分本课题与单文件参考工作的位置**。

### 6.5 直接回答用户的问题

> "把每个 .v 文件按单文件流程过一遍，能不能保证 IP 整体功能不变？"

**Soundness（健全性，逻辑层面）**：

- ✅ **如果**每个文件就是一个模块、SEC 在模块端口处证 strict equivalence、LLM 没动任何端口语义/时序 → 组合后 IP 等价（C1–C5 都满足）。
- ❌ **如果**有任何 cross-module 优化、任何 admissible delay、任何 FSM/握手协议改动 → 组合性失效。

**Completeness（完备性，实用层面）**：

- ❌ **几乎肯定不够**——大多数 PPA 收益来自跨模块重构，单文件方法系统性地排除这部分空间。
- ❌ **隐性时序假设是雷区**：开源 RTL 大多不显式声明模块间时序契约，LLM 看不到这些约定，单模块 SEC 通过但 IP 行为变了的情况会出现。
- ⚠️ **状态映射难度**：SEC 在含内部 FSM 的模块上需要给 register correspondence 提示，LLM 改了内部状态编码后这个提示就失效，单模块 SEC 经常会失败、需要人工干预。

**实操建议**：

1. **首批实验仍采用 S1（逐模块 SEC）作为最稳的 baseline**——这与现有工作的"等价手段"对齐，便于公平对比 PPA 收益。把它作为"下限"。
2. **同时把 S3 作为目标形态**——在 S1 baseline 之上，引入 IP 自带的参考模型（FEATHER 的 MINISA、NVDLA 的 cmod、VeeR 的 Whisper、CV32E40P 的 Spike/Imperas、OTBN 的 OTBNSim），让 LLM 能做跨模块改动，用系统级 reference 验证。**这才是"整工程进化"超过"单文件进化"的核心证据**。
3. **S2（层次化 SEC）暂不主推**——工程成本高，且需要逐层写 SEC 设置脚本；建议只在 S1 / S3 都出问题、需要精确定位"哪一层引入了等价破坏"时再用。
4. **报告 Exp 梯度的设计可以与此对应**：
    - Exp-0a (FEATHER) / Exp-3 (ZipCPU) → S1 主导（formal 强）；
    - Exp-0b (VeeR) / Exp-1 (CV32E40P) / Exp-4 (NVDLA partition) / Exp-5 (OTBN) → S3 主导（系统级 reference 强）；
    - Exp-2 (SCR1) → S3 但 reference 退化为 L3 回归，作为下限对照。
5. **PPA 评估边界**：单模块 SEC + 单模块 DC area/timing 给出的是"局部 PPA"；**IP 整体 PPA 必须 DC 跑顶层综合**，否则跨模块共享资源、I/O 整形、关键路径分析都会失真。
6. **一个具体警示**：参考工作"4615 行 5 module" 的体量，CV32E40P 的 `cv32e40p_id_stage.sv` 单文件就已经接近，但它依赖 `cv32e40p_decoder.sv` / `cv32e40p_register_file.sv` / `cv32e40p_controller.sv` 等十几个其他模块；**单文件 SEC 通过 ≠ ID stage 在系统里行为不变**，因为内部 register correspondence 涉及到的状态可能在系统 reset/异常路径下与其他模块绑定。这种情况下必须叠加系统级 functional regression。

### 6.6 给本课题的进化反馈 loop 推荐设置

每轮 LLM 进化的反馈信号建议按 **fast → slow** 三段排列：

```
Tier-A (fast, < 5 min):  Formality CEC（非功能性改写最常用的"语法兜底"）
                         + Verilator/VCS 短 smoke 回归
Tier-B (mid,  ~30 min):  JasperGold SEC at modified-module boundary
                         + 完整 ISA 回归（riscv-tests / MINISA trace / cmod diff）
Tier-C (slow, hours):    DC 顶层综合（IP-level area/timing/power）
                         + UVM functional coverage 签核（如 CV32E40P / OTBN）
                         + 可选 IP-level SEC（顶层证整 IP，仅在 Tier-A/B 都过后再跑）
```

- Tier-A 给 LLM 提供秒级反馈，过滤掉绝大多数"语法等价但 PPA 没收益"的改动；
- Tier-B 才进入"语义等价"严肃判定，是 S1 与 S3 的真正分界；
- Tier-C 是签核环节，决定哪一轮进化产物可以作为"下一轮 baseline"。

**与单文件参考工作的最大区别**：他们的 Tier-B 就是 "JasperGold SEC 单模块" + "DC 单模块"；我们要求 Tier-B 同时含 **IP-level 系统回归** + **JasperGold SEC at module-of-interest**，确保跨模块假设没被破坏。

## 7. 推荐的第一批实验梯度

按"工程量从小到大 + 工具链贴合度从高到低"排序：


| 顺序                              | 项目                                 | 等价层                                    | 理由                                                                                                            |
| ------------------------------- | ---------------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Exp-0a (NPU baseline)           | **FEATHER 16×16 配置**               | L2 (MINISA) + L1 (Formality)           | MINISA + DC PPA 现成，单次综合 < 1 天，最快可拿到一组进化前后 PPA 对比。                                                             |
| Exp-0b (CPU baseline / 轻量 diff) | **VeeR EH1**                       | L2 (Whisper) + L3 (riscv-tests)        | Whisper ISS + VCS Makefile + 中等规模，1-2 周可跑通进化 → VCS regression → DC area/timing。                               |
| Exp-1 (CPU 工业 DV)               | **CV32E40P + core-v-verif**        | L2 (Spike/Imperas) + L3 (UVM coverage) | 在拿到 Exp-0b 经验后，挑战 UVM DV 完备性更高的工程；可与 Exp-0b 形成"DV 强度 vs. 反馈延迟"对照。                                             |
| Exp-2 (CPU 下限对照)                | **SCR1**                           | L3 only                                | 用最小、最干净的 SV CPU 作为"L3-only 等价手段够不够"的对照实验；验证当 ISS 不可用时进化置信度损失多少。                                               |
| Exp-3 (CPU L1 样板)               | **ZipCPU**                         | L1 (SymbiYosys) + L3 (Verilator)       | 用唯一在仓库内系统性使用 formal property 的项目验证"用 LEC/formal 作为主反馈信号"的进化范式是否可行；与 Exp-0b / Exp-2 形成"L1 / L2 / L3 三种主反馈源"对照。 |
| Exp-4 (NPU 工业 PPA)              | **NVDLA 单 partition（如 SDP 或 CSC）** | L2 (`cmod`) + L3 (synth_tb)            | 用现成 DC 脚本做 PPA baseline，对照 Exp-0a，判断进化对工业级 NPU 的可迁移性。                                                         |
| Exp-5 (高保真 DV 上限)               | **OpenTitan OTBN**                 | L1 (FPV) + L2 (OTBNSim) + L3 (UVM)     | 用作者维护的 OTBNSim + dvsim+VCS + Formal Property，验证进化能否在三层等价手段全开的高 DV 强度下保持 functional correctness。               |
| (备选)                            | **Hummingbirdv2 E203**             | L3 (+可外挂 L2)                           | RV32 教学/工业对照，中文文档完整，团队认知成本低；可在 Exp-1 与 Exp-2 之间插入做 RV32 micro-arch 对照。                                        |
| (最后备选)                          | **RV12**                           | L3 (+可外挂 L2)                           | 仅当前述 CPU 候选都不可用且 license 风险可接受时再启用。                                                                           |


## 8. 仍需确认 / 跟进的事项

1. 学校 VCS / DC license 是否包含 **VHDL Compiler**（直接决定 NEORV32 选项能否启用）。
2. 学校 DC license 等级（是否包含 **DC-Ultra**、**Power Compiler**），决定 PPA 报告维度。
3. 是否能拿到 **Innovus / IC Compiler II** license，决定 FEATHER / NVDLA 能否完成 PnR 阶段对照。
4. **H2 强度策略已锁定（最低强度）**：L1 / L2 / L3 任一命中即视为通过；Synopsys Formality 作为 L1 通用兜底。该决定使 SCR1 / NEORV32 / Hummingbird / RV12 等"L3 only"的项目继续保留在候选集中。若后续实验发现 L3-only 兜底不够，可以局部收紧到"L2 必需"，但**不作为当前筛选条件**。
5. **License 边界确认**：ZipCPU (GPLv3)、RV12 (Non-Commercial)、NVDLA (NVIDIA Open NVDLA License) 三个项目的二次分发与论文/商业合作边界需要在第一次跑 Exp 之前与校方/法务对齐。
6. **Hummingbird E203 的 VCS Makefile**：当前 release (0.2.1) 默认仿真器是 iVerilog；需要在 `vsim/` 历史 commit 或 SI-RISCV/e200_opensource 中找回 VCS 脚本，并固化在我们本地工作树中。
7. 评估"整工程进化"成功标准：是仅看 VCS regression pass，还是要求 DC 综合通过且 PPA 不退化？此项决定每轮 LLM 进化的反馈延迟。
8. **生成式 RTL 项目的处置**：本课题首批实验**不纳入**任何"build artifact = RTL"的项目（VexRiscv / Rocket / BOOM / Gemmini 等）。如果后续要做高层抽象进化对照实验，可以单独立项，但不与当前 8 个手写 RTL 候选混在同一批次。

