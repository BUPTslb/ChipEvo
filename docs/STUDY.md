# 多模型、双目标、best-of-five RTL 优化实验

维护更新（2026-10-25）：当前代码已升级为统一进度记忆协议 v5，详见
`PROGRESS_MEMORY.md`。下文 v4 的已运行批次是历史记录，未原地改写。
v5 已通过离线回归与真实轨迹回放，尚未开展真实模型验收或重启实验。

本协议的每个“模型 × 设计 × 目标”是一条独立优化链。当前设为 10 轮，每轮 5 个
候选，总计每条链 50 个候选；4 模型、5 设计、2 目标合计 2000 个候选。一个候选可有
多次 API 往返及工具调用，不能把候选数、API 请求数、工具调用数混为一谈。

## 两类目标

`configs/studies/multimodel.json` 保存本次实验设置。时序优化目标初设 10000MHz
（0.1ns），作为高压映射目标，不要求基线或候选真的满足该频率。目标是固定约束下
减小 D，面积不得超过该时序配方初始基线的 1.05 倍。D 不是物理签核 fmax。

面积任务初设 200MHz（5ns），必须先确认原始基线能满足该目标的普通及全局 setup
检查。候选在保持该固定频率的前提下减小面积；允许使用基线剩余裕量，D 可以比
初始 D0 大但不能超过周期。额外提高频率不获得面积加分。面积配方不向 ABC 传入
`-D`，时序配方传入相应 ps 目标；每个任务内保持配方、PDK、库、IO 和保护规则固定。

面积基线校准以实际综合后的 setup 裕量为依据，暂选约 10%–20% 周期余量。
这是实验留给面积优化的预算选择，不是工艺规律。面积 ABC 脚本不依赖周期，
因此可以冻结同一面积网表仅重跑 STA 核查不同周期；时序模式不能据此省略重新映射。
失败日志与所有试探周期保留，不将“综合进程结束”当作时序通过。

固定存储、周期行为、全设计等价及 hold/特殊检查非退化合同继续适用。
目前允许基线已有 hold 负裕量但禁止进一步恶化；这不是物理时序签核。

## 每轮选优

1. 从当前最优 RTL 一次性复制出五个候选工作目录，五者 parent hash 相同。
2. 各自启动全新消息历史；五个候选并行生成，互不读取代码、对话或工具反馈。
3. 每个提交独立执行权限检查、对固定原始 RTL 的等价验证、综合和 STA。
4. 只在约束通过的候选中选主指标最小者；主指标相同则比较另一指标，最后按候选号
   稳定排序。只有主指标严格优于当前最优、超过公开数值容差，才替换下一轮起点。
5. 全部无改善、失败或未证明时，继承上一轮最优，继续下一轮。

2% 只用于最终 resolved 报告，不用于每轮晋级。不能因为某次只改善 0.3% 就丢弃。
所有面积上限和频率约束相对实验开始时冻结的目标，不随着每轮漂移。
评分用初始基线，选优用当前最优，两者明确分开。

prompt 在基线校准后生成并冻结，所有模型、所有轮次使用同一任务的相同 prompt hash。
不注入其他候选结果、其他轮次对话或此前模型反思；跨轮传递的只有选出的 RTL。
固定定位上下文来自本任务初始网表，可能随 RTL 改写过时，模型应搜索当前源码。
模型可以在预算内获取自己当前候选的 EDA 反馈，反馈不跨候选共享。

## 隔离边界

当前内置运行器是 API 工具代理模式，不是给模型一个能看到整个项目的终端。
模型只能调用 list_sources/read_source/search_source/apply_edits，以及预算允许时的
evaluate_candidate。所有路径只在该候选的固定 RTL 文件清单内解析；不能创建路径、
软链接、任意 shell/Python 命令或网络请求。修改必须通过 policy 检查，否则回滚。

参考 RTL、完整工具实现、两个目标的评分脚本、资产、全部候选历史和 API 密钥都
只在宿主评测侧；不会作为文件读取工具的可访问路径提供给模型。模型收到的只包含
本任务 prompt、保护摘要及自己的源码/反馈。不要把整个 deployment 包直接挂载到
一个具有任意终端权限的外部 Agent，并宣称实现了同样的隔离。如果要测外部 CLI
Agent，需另接容器沙箱和能力等价的工具代理；当前未实现该模式。

外部测试平台可用 `candidate-bundle` 导出最小单目标包，解压到隔离容器的
`/workspace`，只含 rtl、task.md、manifest/policy/context。包中没有 reference、评分
实现、其他目标 prompt 或模型密钥。每个候选必须使用新容器/独立目录，不能共享
宿主历史目录。该导出只解决可见文件隔离，task.md 仍使用内置工具接口，平台需提供
相应工具适配。若直接使用终端 Agent，需要另行固定终端版 prompt 和工具预算，
不能声称与 API 工具模式条件相同。最终独立评分包可读取 `/workspace/rtl`。
内置 study-run 不需要该导出。

## 模型与资源记录

### 上下文管理（更新）

当前完整策略见 [CONTEXT.md](CONTEXT.md)。API 次数、工具次数和累计源码读取量均不设上限；保留逐次 usage 统计、分块读取、工具返回卸载、同模型摘要、历史分页召回和上下文溢出恢复。摘要和恢复均计入实验消耗。

支持 `openai_chat` 兼容协议和 `anthropic_messages`。Kimi 当前填入官方 k3；其余
模型需要实验者填写精确 API model ID、base URL 和 key 的环境变量名，不能仅填品牌。
适配器的工具/usage 格式参考官方文档，实际四家连通性不因模拟测试通过而自动成立。

每个候选保存完整请求、响应、消息历史、工具参数/结果、停止原因、模型返回 ID、
耗时、错误、原始 usage、规范化 token 计数、EDA 日志及起止 RTL hash。
输入、输出、推理、缓存 token 分开；推理 token 是输出的子集，不重复相加。
Anthropic 缓存读写与普通输入分开计数，汇总时纳入总输入；缺失值为 null/incomplete，
不会伪装为零成本。不同 tokenizer 的 token 数不等于同等计算量，成本需另配统一日期价格。

报告分别统计 API 尝试/完成数、每种工具次数/失败/耗时、EDA 反馈次数、等价通过率、
约束通过率、resolved、最终改善和每轮最优轨迹。EDA 进程时长和候选总墙钟时间区分，
并保留基线重复测量的开销；并行进程时长之和不是 CPU 时间或实际总耗时。
仅确认上下文溢出时进行一次压缩恢复；摘要、失败请求与恢复均计入消耗，不免费重生成候选。

## 运行和输出

```bash
# 仅查看实验矩阵；即使频率/模型尚缺失也不启动实验。
python -m chipevo study-plan --config configs/studies/multimodel.json

# 只有明确决定执行整个实验时才使用；先填齐模型、环境变量和校准后的频率。
python -m chipevo study-run --config configs/studies/multimodel.json \
  --output artifacts/studies/my-run --run-model --run-eda

# 只汇总已有记录。
python -m chipevo study-report --output artifacts/studies/my-run
```

所有目标先做基线资格检查；任一面积频率不能满足时，不会静默忽略该设计后启动
不完整模型比较。通过后才开始模型链。当前按模型/设计/目标顺序执行链，链内五候选
并行；时间比较应注意 API 服务负载和执行顺序。输出目录必须全新，不覆盖旧数据。
中断后可读取各候选/每轮记录，当前不会自动续跑中断实验或重用未完成候选。

完整保留中间网表和分层证明文件可能需要大量磁盘。运行器在基线资格检查后，
依据实际基线产物大小估计整个实验的保存量，并留出默认 10GiB 空间；预计空间不足
时在任何模型调用前停止，写出估计值，不删除旧实验或丢弃失败样本。估计不是硬上限，
候选规模增长仍可能增加空间；部署者应准备独立实验存储。

```text
artifacts/studies/<run>/
  study.json, plan.json, state.json, report.json
  trusted-assets/                       宿主侧固定公共资产
  tasks/<design>/<objective>/            单目标评测环境及 fixed-prompt.md
  qualification/<design>/<objective>/    初始资格检查及定位证据
  chains/<model>/<design>/<objective>/
    initial-rtl/, progress.json, summary.json
    round-001/
      candidate-00/rtl/, start.json, result.json
      candidate-00/agent/                API 与工具记录
      candidate-00/evaluation/           证明、综合、STA
      candidate-01/ ... candidate-04/
      selected-rtl/                     仅有真实改善时创建
      round.json
```

接口参考：[DeepSeek](https://api-docs.deepseek.com/api/create-chat-completion/)、
[Claude 工具协议](https://platform.claude.com/docs/en/agents-and-tools/tool-use/how-tool-use-works)。

# Verification correction: structural matching

The prover uses `equiv_make`, SAT-based `equiv_simple -seq 2`, and
`equiv_status -assert` after the existing hierarchy, child/memory-input cuts and
clock normalization. It does not use `equiv_struct -icells -fwd`: that heuristic
can add invalid proof obligations for commutative rewrites such as `a & b` to
`b & a`, spuriously requiring independent inputs to be equal. Removing it does
not bypass output/state obligations or the fixed-memory/interface contract.
The result records `proof_recipe=sat-only-v1-no-structural-assumptions`.

Native positive/negative regressions require explicit execution:

```bash
CHIPEVO_NATIVE_FORMAL_TESTS=1 .venv/bin/python -m unittest discover -s tests
```

They cover combinational/registered operand swaps, mux rewriting, carry
preservation, and rejection of real Boolean/carry errors. Normal maintenance
test discovery skips native workloads unless that environment variable is set.

The original K3.1 Pro pilot and scores remain unchanged. Saved RTL was regraded
in a new trusted snapshot under the corrected prover, with identical synthesis,
STA, constraints and scoring. See `reports/kimi-k31-formal-fix-latest.json`.
Original tool feedback influenced model search, so corrected grades do not turn
the old trajectory into an unbiased benchmark rerun. No additional model calls
were made for the correction.

# Current interaction time budgets

Summary policy v4 supersedes the unrun v3 special adaptation: ALL three models
retain their main-task high reasoning options during summarization. The common
summary output cap is 16384, with a 6000-character requested checkpoint. Main RTL
optimization keeps its 128000-token output ceiling. The unified first-round batch
uses a common 262144-token client context window and 65536-token input budget.
Provider-specific meanings of high and native context capacities still differ.
After a summary failure, deterministic memory
remains available and the next summary requires 8, 16, then at most 32 new groups;
forced compaction cannot bypass this failure backoff. This is a versioned policy
change, not a retroactive change to old results. The unified batch requires a real
DeepSeek summary/file-handoff smoke pass for this exact asset lock before dispatch.

Host API calls use a Linux cross-process request gate. Each model entry sets
`max_concurrent_requests=5` (the default and maximum). Calls sharing a normalized
base URL and exact model name share five slots across designs, rounds, processes
and study directories under the same OS user. Summary/recovery calls also use
these slots. API credentials and config model IDs do not appear in the lock key.
Do not override `CHIPEVO_API_LOCK_DIR` per experiment: all host workers must share
the same directory. Locks release on process exit; no stale PID cleanup is needed.
Current accounting (`active-v2-excludes-api-queue`) excludes all API-slot
acquisition/waiting time from the 3600-second candidate budget. Queue time has no
candidate/API deadline; after admission, HTTP I/O timeout is min(1200 seconds,
remaining candidate active time). Successful and failed calls retain queue time.
Model I/O, context management, tools and in-rollout EDA still consume active time;
final external grading remains separate. An admission turnstile prevents fresh
requests from bypassing the caller currently waiting for a free slot. A concurrency
cap is not an RPM/TPM cap. Historical files retain their original accounting.
No additional EDA concurrency gate is introduced.

This host limiter does not control model requests issued by an external task
platform. That platform must enforce its own model-wide request cap. Five task
batches of five candidates could otherwise run 25 independent agents at once.

New studies use `api_timeout_s=1200` and `candidate_wall_timeout_s=3600`.
The HTTP I/O timeout for each request is still the smaller of 1200 seconds and
the candidate's remaining active-time budget, excluding API-slot waiting. The candidate budget includes model
calls, compaction and tool/EDA-feedback waiting; final external grading is separate.
These defaults do not rewrite frozen historical study configurations or restart
experiments. A larger timeout does not restore an exhausted provider quota.

