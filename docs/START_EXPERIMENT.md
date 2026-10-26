# 启动 RTL rollout

启动脚本默认只检查配置并显示计划。只有显式 `--run` 才调用模型和原生 EDA。
`~/.bashrc` 必须在交互终端加载；Python 不会自动读取它。不要在日志中 echo 密钥。

```bash
cd /home/shen/Desktop/project/ChipEvo
source ~/.bashrc
export ChipEVO_Deepseek ChipEVO_Kimi
bash tools/start_rollout.sh configs/studies/pilot-kimi-zipcpu.json --plan
```

`.venv` 已装 pyslang 11.0.0。迁移平台时按 README 创建 .venv 并安装 requirements；
脚本也支持通过 CHIPEVO_PYTHON 指定 Python 解释器。

## 接入和预算

| 模型 | 协议 | 入口 | 环境变量 |
|---|---|---|---|
| DeepSeek，默认 deepseek-v4-pro | openai_chat | https://api.deepseek.com | ChipEVO_Deepseek |
| Kimi k3 | openai_chat | https://api.kimi.com/coding/v1 | ChipEVO_Kimi |
| GPT gpt-6-astra | openai_responses | http://127.0.0.1:8317/v1 | ChipEVO_Astra |

GPT 使用代理客户端密钥，启动脚本在正式 --run 时从
`~/.local/share/astra-api-proxy/client.key` 加载到子进程环境，不保存进项目、配置或日志。
不会改写已有 OPENAI_API_KEY。需要先确认 astra-api-proxy.service 运行且源登录有效。
运行中凭据/订阅失效会产生失败候选，目前没有透明重登或通用失败重试。

配置均显式使用 high 思考档位；各供应商 high 不代表相同推理计算量。
DeepSeek 型号是本次准备的默认选择，可由实验者换成明确 model ID。
Kimi/GPT 采用 262144 的保守客户端窗口上限，未经推理测试证明账户实际可用窗口；
共同输入预算仍是 65536 **估算单位**，当前按 UTF-8 JSON 字节及 framing 估算，
不是精确的提供商 token 数。单次优化响应输出上限 128000 token（各模型统一）；摘要输出预算单独为 4096 token；每候选 API/工具调用次数、
累计源码读取不封顶，交互时间预算 1800s，单请求超时 600s。
阻塞 EDA/工具执行可能跨过交互时间预算，不能把 1800s 当作整个候选的硬进程截止。
每候选最多一次主动 EDA 反馈，外部最终统一评分另执行一次。

## 逐步执行

1. **Kimi × ZipCPU，1 轮，两目标，共 10 候选。**验证真实的读取/修改/工具回传和评分。
2. **三模型 × ZipCPU，1 轮，两目标，共 30 候选。**检查全部供应商的协议、模型返回 ID、
   限流/超时、token usage 和工具调用记录。前两步是流程检查，不能得出模型能力排名。
3. **三模型 × 五设计 × 两目标 × 10 轮 × 5 候选，共 1500 候选。**前两步正常后再正式比较。

```bash
# 下面命令真的运行模型和 EDA。输出目录必须不存在。
bash tools/start_rollout.sh configs/studies/pilot-kimi-zipcpu.json --run artifacts/studies/pilot-kimi-001
bash tools/start_rollout.sh configs/studies/pilot-three-models.json --run artifacts/studies/pilot-three-001
bash tools/start_rollout.sh configs/studies/three-models-10rounds.json --run artifacts/studies/main-three-001
```

不要一次性粘贴执行全部三条；逐步检查上一阶段后再启动下一阶段。
Claude 未配入本次可执行配置，因为尚未提供可用接入信息。

正式实验建议在 tmux 中运行，防止 SSH 断连结束进程：

```bash
tmux new -s chipevo
cd /home/shen/Desktop/project/ChipEvo
source ~/.bashrc
export ChipEVO_Deepseek ChipEVO_Kimi
bash tools/start_rollout.sh configs/studies/three-models-10rounds.json --run artifacts/studies/main-three-001
# Ctrl-b 然后 d：离开会话；tmux attach -t chipevo：返回。
```

tmux 只防终端断开，不提供进程崩溃/重启后的断点续跑。没有自动续跑时，不宜第一次就跑完整矩阵。

## rollout 内部流程

启动 → 凭据存在性和可信资产检查 → 全部设计/目标基线资格检查 → 固定任务 prompt/定位证据
→ 当前链最优 RTL 复制五份 → 五个独立新对话并行读写各自 RTL → 每份权限/等价/综合/STA
→ 合法候选按主指标选优 → 真改善则更新该链 RTL，否则保持 → 下一轮 → 链与全实验汇总。

不同模型、不同目标从初始参考分别开始；只在同一链跨轮传递被选中的 RTL。
不传递其他候选消息、历史反思或其他目标脚本。框架管理工具执行和上下文；
HTTP API 本身不会自动启动一个完整编码 Agent。

基线缓存不跳过资格检查，也不缓存候选；每个候选仍独立证明和测量。
出现任一基线目标不合格时，整个矩阵在模型调用前停止，state.json 记录原因。
当前选优是“主指标真实改善”，最终 resolved 门槛为相对初始基线改善 2%。

## 查看结果与修改配置

```bash
.venv/bin/python -m chipevo study-report --output artifacts/studies/main-three-001
```

总体看 state.json/report.json；每链看 chains/<model>/<design>/<objective>/progress.json
和 summary.json；每轮看 round-*/round.json；每候选看 result.json、agent/agent.json、
agent/tool-events.json、evaluation/report.json。运行未结束时 summary.json 可能尚未生成。
完整请求/响应在结束后 gzip；usage、工具事件、评分等 JSON 仍直接可读。

### 阶段交接以文件为准

选优读取各候选已保存的 result.json，下一轮读取 progress.json 指向的 RTL 目录和指标。
不使用候选执行函数的内存返回值作为交接结果。每轮 input.json 保存父 RTL 路径/哈希、
父指标、prompt 文件/哈希和前序 progress 哈希；每个候选 start.json 绑定该 input 文件。
入选 RTL 复制到 selected-rtl/ 后核对其与已评分 RTL 的哈希；无改善时，progress 指向
更早的最优目录，不重新生成一份假入选结果。round.json 保存选优记录，随后发布 progress。

原生综合通过 mapped.v/json 和 area.json 向 STA 交接；评分读取 metrics.json，
候选汇总读取 evaluation/report.json。主动 EDA 反馈也读取 feedback-*/report.json。
模型请求先写 request-N.json，再读取该文件发送；响应保存原始 response-N.json 及
规范化 response-N.metadata.json 后，读取后者继续工具循环。
每次工具执行结果先写 tool-NNNNNN.json，再读取结果回传模型；transcript.json 随检查点更新。

JSON 使用临时文件写入后原子替换；这保证单文件发布完整，不等于多个文件的事务或
断电持久化保证。候选结束后请求/响应和逐次工具 JSON 无损 gzip；tool-events.json、
usage、agent.json、result/round/progress/summary 等仍保留普通 JSON。
文件交接不意味着已实现断点续跑，当前重新运行仍要求新输出目录。

同时检查 returned_models、工具失败、等价/约束通过率、优化轨迹和 usage 完整性。
API 请求数不等于候选数；输入/输出/缓存/推理 token 分开统计，推理 token 不重复计入总数。
本机代理若没有返回原始 usage，报告必须标记缺失，不能拿不完整 token 数做效率排名。
当前链按模型/设计/目标串行调度，链内五候选并行；应记录机器负载、代理状态和模型版本。

本轮保持已有目标：时序均 10000MHz；面积 Gemmini 153.846MHz、NVDLA 200MHz、
ZipCPU 266.667MHz、CGRA 142.857MHz、Feather 474.158MHz。新启动仍要按当前资产重新资格检查。

修改模型/预算/轮数等已锁定配置后，由评测者确认修改并更新锁（不运行 EDA）：

```bash
.venv/bin/python tools/freeze_assets.py --update
```

新一组配置对应新输出目录。不要在正在运行的实验中改配置、工具或 RTL 参考。
