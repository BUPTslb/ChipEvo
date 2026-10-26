# Current NVDLA frequency update

NVDLA now uses macro-reference-v1: area 200 MHz (5 ns), setup slack +0.915329 ns;
timing optimization 10,000 MHz (0.1 ns), an aggressive target rather than achieved
frequency. The former 40 MHz latch-model workaround is retired. Other designs
retain their existing task configurations. See NVDLA_SRAM.md for qualification.

The calibration below is historical and refers to the previous NVDLA reference.

# 已实测的面积基线频率

| 设计 | 200MHz setup 裕量(ns) | 面积频率(MHz) | 周期(ns) | 调整后 setup 裕量(ns) | 说明 |
|---|---:|---:|---:|---:|---|
| gemmini | -0.400500 | 153.846154 | 6.500 | 1.099523 | 余量 16.92% |
| nvdla | -8.635000 | 40.000000 | 25.000 | 0.000000 | RAM latch 通过后裕量报零，非 10–20% 余量校准 |
| zipcpu | 1.988000 | 266.666667 | 3.750 | 0.738352 | 余量 19.69% |
| cgra | -0.651500 | 142.857143 | 7.000 | 1.348511 | 余量 19.26% |
| feather | 3.271000 | 474.158369 | 2.109 | 0.380088 | 余量 18.02% |

全部时序优化任务固定 10000MHz（0.1ns），作为优化压力目标，不是已达成频率。
本次只执行面积基线综合/STA，未调用模型；未宣称重新证明五个设计的等价性。
NVDLA 的 200MHz 普通 check 路径为正裕量，但固定 RAM latch 路径失败，不能归因为 LLM 数据通路优化能力。
