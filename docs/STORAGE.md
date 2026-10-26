# 基线缓存与实验产物保留

配置入口为 `configs/artifacts.json`。本机制只作用于启用此版本后产生、带
`.chipevo-evaluation.json` 标记的新评测目录；不会扫描或删除既有 history、archive
或其他实验。维护、打包、查看报告不会启动模型或 EDA。

## 可信基线缓存

本地 evaluate 和 study 共享评测器拥有的 `.cache/baselines/`；平台评分入口使用
`/eval/baseline-cache/`，不从候选 `/workspace` 导入缓存。缓存不可由模型工具读取或写入。

键包含参考 RTL、参数/文件清单、保护规则、约束、技术库/宏、评测代码、工具链配置、
已校验的完整运行时清单、目标类别、实际周期以及语言/时区环境。改变这些输入会失效。
时序和面积任务分别建缓存；不同模型可复用同一可信基线。候选 RTL 不属于键，
也从不缓存候选的证明或 PPA。

每次评测先验证受信任资产及原生工具文件。首次缺失时运行基线综合/STA，并保存其
指标、小型报告和定位快照。后续相同输入复用这些测量。每个候选仍执行权限检查、
完整等价性验证、综合和 STA，最终仍使用相同的评分规则。

每键进程锁防止五个并发候选重复建基线；锁随进程退出释放。完整性签名和原子发布
防止接受被修改或写到一半的记录。失败的测量不会入库，损坏项会重建。缓存目录不可用
时退回实际测量并记录原因；不会把候选提交的 metrics 当作参考。此保护依赖评测器目录
不向模型开放，不是对拥有宿主账号权限的攻击者的隔离。

默认最多 **32 项、256 MiB**，按最近访问淘汰旧项；这两个上限用于 JSON 缓存记录，
不包括少量锁文件和签名密钥。缓存清理不触及实验记录。`.authority` 是本机私有签名密钥，
缓存与密钥均不进入部署包。删除整个缓存只导致下次重新测量，不改变分数。

`report.json.baseline_cache` 记录 hit/key/verified 及缺失或禁用原因。
study 汇总记录最终评测的 baseline_cache_hits/misses；反馈评测命中情况在各自 report 中。
已有历史报告不会自动导入新缓存；下次显式执行 EDA 时才会首次填充。

## 保留什么、清理什么

| 内容 | 默认处理 |
|---|---|
| 各候选 RTL、每轮选中 RTL、父版本哈希、固定 prompt | 保留 |
| 评分、原始 PPA 数值、任务配置、等价结论、进程状态/耗时 | 保留 |
| STA 路径、电气检查、生成的 SDC/综合/STA 脚本、模块定位快照 | 保留 |
| API usage、token 统计、工具调用事件、候选/轮次/链汇总 | 保留原始 JSON |
| 已结束候选的 API 请求/响应、完整 transcript、移出的历史 | 无损 gzip，保存原文件哈希；运行中的上下文不压缩 |
| 成功评测的 mapped.v/json、证明分区 JSON/IL、临时映射库 | 删除，可按固定输入重新生成 |
| 评测目录中重复复制的 reference、baseline RTL | 删除；可信参考和外部候选/选中 RTL 保留 |
| 原生工具 .log | 每份保留最多 128 KiB 原始头尾内容再 gzip；中间截断有显式标记，记录原长度/哈希 |
| 失败评测的反例或失败模块中间文件 | 优先保留，额外证据合计最多 16 MiB |

**16 MiB 是失败额外证据预算，不是整个目录的硬上限。** RTL、结果、必要脚本、
小型报告和各份有界日志另计。极大单文件放不进预算时不会为了保留它而突破上限。
超预算失败可在排查时显式使用 full 重跑；不能宣称截断日志仍是完整日志。

评测写出评分后才清理。`retention.json` 记录模式、删除量、日志截断和原始哈希；
清理异常会写入 report.retention_error，不改变已算出的分数。评分和报告汇总不依赖
被删除的网表或原始 .log。定位查询读取事先生成的快照，缓存命中也可生成相同任务提示。

## 调试与容量规划

默认成功 compact，失败 diagnostic。可在配置中将任一种设为 full；单次 CLI 调试：

```bash
python -m chipevo evaluate --design zipcpu --objective timing \
  --candidate designs/zipcpu/rtl --output artifacts/runs/debug-unique \
  --run-eda --retention full --no-baseline-cache
```

这条命令会真的运行 EDA，日常框架维护不应执行。full 保留全部中间产物；
no-baseline-cache 强制重测基线，候选在所有模式下均重测。

study 在模型调用前估算保留体积、五个并发工作集和 agent 记录，并检查磁盘余量；
每轮开始再检查余量。不足则停止并保留先前记录。配置 `storage.min_free_gib`
默认 10，`storage.estimated_agent_bytes_per_candidate` 默认 8 MiB。估算不是硬配额，
大设计、无限次数 API 调用仍会增长；并发工作阶段仍须容纳完整网表和证明分区。

本次没有实现断点续跑。现有 progress/round/result 用于审计和查看，重新启动仍要求
新输出目录；不会自动读取已完成候选继续 rollout。原生缓存只复用成功基线测量，
不是候选断点。中断时尚未完成的目录也不会自动清理，保留供人工排查。

部署包和评分上传包都不包含 artifacts、archive、.cache 或签名密钥。
