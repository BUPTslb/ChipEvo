# 模块索引与面积贡献定位（hierarchy_area）

## 当前任务默认接入（2026-10-24 更新）

`configs/tasks/<design>.<objective>.json` 的 `localization` 字段定义默认方式。
时序任务：`timing_module` 为主，模块面积贡献为辅助；面积任务：`hierarchy_area`
为主，关键路径为辅助。两者均过滤受保护模块，固定存储，保留全设计等价验证和顶层评分。

`prompt` 现在自动读取这些证据并把精简上下文写进 prompt，同时保存完整的
`.context.json`。不提供 `--run` 时读取已冻结索引及 `context/timing_module.json`；
这些证据注明历史来源，不能宣称是当前脚本的新测量。Gemmini 历史宏网表的路径来自
已有 STA 文本，保留报告精度限制。其余历史 JSON 同样不代表新流程已验证。

```bash
# 生成两类平台任务材料，不调用模型，不执行 EDA。
python -m chipevo prompt --design zipcpu --objective timing --output artifacts/prompts/zipcpu-timing.md
python -m chipevo prompt --design zipcpu --objective area --output artifacts/prompts/zipcpu-area.md

# 如果已有新流程的测量，优先用该目录定位；仍只读取。
python -m chipevo prompt --design zipcpu --objective timing \
  --run artifacts/runs/your-existing-run --output artifacts/prompts/zipcpu-current.md
```

`--strategy` 可以显式覆盖默认定位方式，用于固定预算的对照实验。
`timing_syntax` 只是语法范围辅助，不是经过证明的语义逻辑锥。
缺少时序证据或没有可修改目标时会报错，不能静默退化为盲目选择文件。

早期 smoke 的五设计两类任务采用 10ns；当前多轮实验使用各自目标频率，见
`docs/STUDY.md` 和 `configs/studies/multimodel.json`。时钟不确定度仍为 0.1ns，输入/输出最大延迟 1ns、
最小延迟 0.1ns，输出负载 0.01pF，输入 transition 为 0.1ns，复位固定为不活跃。
这些是统一初始设置，尚未按设计校准。任务 JSON 是周期唯一来源，实际 SDC 按该值渲染。
时序模式 ABC 的 `-D` 为目标周期对应的 ps 值，面积模式不指定 `-D`；每个任务中基线与候选
使用同一映射方案。最终 STA 和评分约束不因模型输出而改变。

`tools/kimi_smoke.py` 是维护者显式调用的有限测试工具，不是平台 rollout 的依赖。
它仅访问官方 `https://api.kimi.com/coding/v1`、模型 `k3`，读取环境变量或
`~/.bashrc` 中的 `KimiCode_K3`，不打印密钥。必须同时指定 `--run-model --run-eda`；
一个调用产生一个候选，最多五次 API 往返用于源码读取与交付。候选在 artifacts 中，
原始 RTL 不修改，评分调用 `grading/score_timing.py` 或 `score_area.py`。
评测失败、模型未改善和流程错误必须分开报告。

CGRA 保护规则已修复：不再对共享文件名进行 RAM 子串匹配，而按实际模块身份和
寄存器数组声明保护存储，以及时钟/复位寄存器原语。旧策略保存在
`archive/policy-fixes-20261024/`。此修复不改变任何原始 RTL。

### 本次明确授权的流程测试

27 项单元测试、五设计十份任务 prompt 生成通过。仅 ZipCPU 运行了新流程 EDA，
时序/面积两种未修改 RTL 正对照都通过等价、综合和 STA；不能据此宣称其余四设计
已通过新流程。固定周期仍为 10ns，不代表最大支持频率。

Kimi 时序单候选（五次 API 往返，每次最多 8192 token）：修改 cpuops/zipcore，
等价通过；D 从 3.213ns 到 3.203ns，A 从 21527.380 到 21528.178um²，
score=0.03112241、resolved=false（未达到 2%）。
面积候选原始五次往返未交付完整 JSON（输出预算主要用于推理），保留失败。
沿用同一对话显式补做一次 16384-token 交付恢复后，修改 cpuops/div，但 div 等价
未证明，评分正确拒绝，score=0。交付恢复标记为非可比较样本；这不是模型排名实验。
面积配方正对照为 A=21810.138um²、D=3.012ns，和时序配方基线分别测量，不能混用。

详细记录在 `reports/localization-smoke-20261024.json` 和对应 artifacts 下。

这是一种选择源码阅读目标的方法，不是修改权限，也不是保证收益的优化算法。
所有策略共用 policy.json。memory/clock/CDC/reset 保护范围独立于排序。

## 数据从哪里来

对已经显式综合过的 baseline，读取 mapped.json 中的模块定义、子模块实例和
源码属性，再读取标准单元及宏的面积。递归统计每个参数化模块定义的实际实例数。
对模块 M 计算：

    own_area(M) = M 直接包含的标准单元／宏面积之和
    contribution(M) = own_area(M) × 实例数(M)

子模块的内部面积由子模块自己统计，不能在每一层反复累计，否则会把同一块
电路计算多次。按 contribution 降序排列，过滤不可修改模块，提供前几个目标。
面积是映射结果，不是文件长度、代码行数或“模块名看起来复杂”的估计。

模块索引包含 module、file、start/end line、instances、exclusive area、protected。
模型得到全局索引及建议目标，再按需查看定义、端口、上下游实例和相关表达式。
它不直接获得关键路径，因此是检验模型自主结构识别能力的一条对照。

例如一个 6:1、199-bit mux 的单个定义有 15 个实例。模型只改一处定义，就会影响
15 个位置。上一轮模型把动态切片改为显式常量切片 case，等价后面积下降明显。
这说明重复结构值得查找，但是否改善顶层时序仍须重新综合/STA，不由面积排名决定。

## 使用

```bash
# 仅读取已冻结的旧索引，不产生新综合
python -m chipevo context --design cgra --strategy hierarchy_area --output context.json

# 从你先前明确运行过的评测目录更新索引；仍不触发新实验
python -m chipevo context --design cgra --strategy hierarchy_area \
  --run artifacts/runs/your-existing-run --output refreshed-context.json
```

默认索引明确标记 historical：前三个已测设计保留上一轮的实测排序；缺少实测
实例数/面积的设计会显示 null，不能把源码结构推测当作已测指标。

timing_module 在相同索引上增加普通同域路径；timing_syntax 再增加 pyslang 解析
的语法范围。这些范围不是形式化语义逻辑锥，不能据此跳过全设计验证。

上一轮 4k 的 18 次和 8k 的 9 次分别比较三种策略；有效候选只出现在 hierarchy_area。
样本量、提示词的正裕量误解、交付失败及验证后端均是混杂因素，不宣布它普遍胜出。
本次重构没有重复运行这些实验。
