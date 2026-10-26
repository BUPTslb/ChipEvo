# Code Grade 平台部署

当前时序任务发布包为 `dist/platform-timing-20261025-v2.zip`。请以包内
`UPLOAD_INSTRUCTIONS.txt` 为准：五份独立工作区、全英文 Prompt、40 个评分分片
（每片至多 900000 字节）、每设计一份 task.json，及可直接粘贴的 test_by_code.py。
当前时序目标是 10000 MHz / 0.1 ns。本发布不在 rollout 中运行 EDA 反馈，最终独立
评分执行综合、STA 和等价验证。以下旧版整体上传说明不适用于单附件小于 1 MB
的平台限制；不能直接把完整 grader 压缩包作为单个评分附件上传。

workstation 上的新 API 运行器默认同端点、同精确模型名称全局最多 5 个在途请求，
跨线程/进程共享，不限制 EDA。外部平台自己的 rollout 不经过此运行器，必须由
平台设置相应并发；若无法设置，按设计依次启动 batch=5。此次未启动任何实验。

此流程基于用户提供的平台约定：rollout 产物在 `/workspace/`，上传的受信任测试
文件在 `/test_files/`；评分结果必须写 `/eval/code_result.json`，且只允许三项：

```json
{"resolved": true, "score": 0.85, "reason": "..."}
```

## 准备待测模型的工作区

上传/下载项目的部署包，保留 designs、chipevo、technology、configs、tools/runtime、
prompts、requirements.txt、pyproject.toml。不要把 archive、artifacts、.git 上传。
在 Linux x86_64、Python>=3.10 容器中执行 `pip install -r requirements.txt`。
原生工具随项目分发，不能指望 pip 从 requirements 自动安装系统级 Yosys/OpenSTA。

模型只修改 `/workspace/designs/<design>/rtl/`。如果平台把仓库放在
`/workspace/ChipEvo/`，评分器也支持该目录。若只交付 RTL，可用 `/workspace/rtl/`。
这三种布局必须恰好存在一种，以避免误选。

## 上传受信任评分数据

1. 在评测者机器显式运行 `python -m chipevo package-grader`，得到
   `dist/chipevo_grader.tar.gz`。它包含独立评分代码、reference、policy、配置、
   工艺库、宏和原生工具，没有大容量历史文件，也没有候选起始 RTL。
2. 将该文件上传至平台测试数据区，使之出现在 `/test_files/chipevo_grader.tar.gz`。
   也可解包后上传 `/test_files/chipevo_grader/`。
3. 另上传 `task.json`，例如：

```json
{"design":"cgra","objective":"timing"}
```

面积任务改为 `"objective":"area"`。不要将此任务文件放在可被模型修改的
`/workspace` 中。支持 gemmini、nvdla、zipcpu、cgra、feather 五种 design。

## 粘贴代码评分脚本

时序任务粘贴 `grading/test_timing_by_code.py` **全文**，面积任务粘贴
`grading/test_area_by_code.py` **全文**。这些文件是自包含的 bootstrap；它们从
受信任上传包导入完整评分器，不依赖模型工作区里的 utils.py 或评分脚本。
工作区的 metrics.json、report.json、修改过的评测代码一律不会作为成绩来源。

评分过程会运行等价和两次综合/STA。平台必须允许 Linux 原生进程、写 `/eval`，
并提供足够 CPU、内存、磁盘和时间。最大设计的资源需求尚未在该测试平台实测，
需要你后续明确授权后才做真实容器验收；失败/超时会得到 score=0 和具体原因。
外层脚本上限 6 小时，内部综合每次 3600 秒、STA 每次 900 秒，模块证明每项
300 秒。不要把大设计任务放入只有数十秒时限的代码测试容器。

## Prompt

使用 `prompts/timing.md` 或 `prompts/area.md`，填写 design、接口说明和读取预算。
平台 rollout 阶段如果不允许工具反馈，明确只允许读取和修改源码；如果要研究
多轮反馈，再显式提供 EDA 调用预算，不能把两种设置混为一组实验。

当前固定 10 ns、初始 IO/负载配置未重新校准；NVDLA 六个原始未定义输入、特殊
时序检查，以及宏封装未独立形式证明的事实仍保留。正式发布前应由你决定合同，
不能通过修改 grader 隐藏基线问题。
