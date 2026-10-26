# Candidate-local context management and accounting

Current maintenance version: `summary-v5-authoritative-progress`. See
`PROGRESS_MEMORY.md` for version-bound feedback, authoritative summary input,
decoded recall views and the bounded working-source preference. Historical
observations below retain their original protocol. No v5 live experiment has run.

This supersedes the fragment-by-fragment summarizer used in the ZipCPU pilot.
Maintenance checks use mock responses. A live K3.1 Pro/ZipCPU one-round pilot
completed with ten normal deliveries and seven successful summary requests.
Its original equivalence grades required correction for an independent structural
matching defect; see the verification note in STUDY.md. It is a flow-debugging
experiment, not an unbiased model-ranking result.

## Current policy

- Each of the five candidates starts a fresh conversation from the same parent
  RTL. Only winning RTL crosses rounds. Archives, memory and usage calibration
  belong to one candidate, never another model, objective or round.
- `max_api_calls`, `max_tool_calls`, `max_source_chars` are null: no count or
  cumulative-source cap. `rounds=10` and `candidates_per_round=5` are unchanged.
- Retain the existing 1800-second candidate wall timeout, 600-second request
  timeout, 128000-token optimization-response output cap and one explicit EDA feedback call.
  Summary output retains its separate 4096-token budget.
  These are independent limits, disclosed in the experiment configuration.
- The working-input estimate cap is 65536 tokens, further bounded by the actual
  configured model window minus output reserve and 2048-token headroom. It is a
  common benchmark working-memory policy, not a claim that all models have 64K.
- Start managing pressure at 80% of available working input. Preserve the task
  rules, interfaces and fixed-memory restrictions. Source evidence and detailed
  inventories may be paged; never silently shorten the optimization objective.
- After compaction aim for 50% occupancy, retaining as many recent complete
  interactions as fit (and at least the latest one when possible). The target is
  best effort: fixed rules or the latest interaction can occupy more than 50%.

## Retrieval, pruning, compaction and recovery

Initial localization supplies a small set of critical paths/module suggestions
and baseline metrics. The model lists/searches current files and reads selected
ranges rather than receiving the entire project. Per-read pagination is 400 lines
and 24000 characters; `next_offset_chars` supports even a single very long line.
These are page sizes, not total-project-size limits.

`context_manager.py` maintains a request view separate from the complete transcript:

1. Under pressure, offload large tool result bodies, keeping a head, tail and
   candidate-local reference. Exact originals remain in `context-archive/`.
2. If pressure persists, archive older complete interactions and construct one
   bounded factual ledger (default 16000 characters, further reduced for small
   windows). Exclude source bodies and hidden reasoning; retain calls, decisions,
   edit excerpts, results and exact recall references. Make at most ONE summary
   request per reduction, using the SAME tested model. Reuse the prior summary.
   Between summaries require four new interaction groups; pressure during this
   cooldown uses deterministic ledger/offload only. Confirmed overflow can bypass
   the cooldown. Failed summaries also start cooldown and preserve prior memory.
3. Keep summaries as advisory memory below the original rules. Preserve native
   reasoning/signature blocks in retained interactions. Never orphan tool results.
4. Provide `recall_history(ref, offset)` to page exact archived material. A known
   reference cannot access another candidate's files or arbitrary host paths.
5. For a confirmed context-overflow API error only, force compaction and retry
   once that turn. Record the failed attempt and recovery; do not retry auth,
   network or unrelated server errors as if they were context problems.
6. If a summary fails, label it unavailable and retain exact recall references;
   do not fabricate a successful summary. Whole oversized interactions can be
   offloaded. A physically too-small window for fixed instructions/tool schemas
   remains an invalid configuration; a large source file alone is not a reason
   to abandon the candidate.

`source-ledger.json` records candidate-local file hashes, source-page references,
read/search ranges and applied edits. A bounded current inventory is included in
host state independently of the advisory summary. Repeated identical reads return
a short receipt ONLY while that exact unpruned page remains in the request view.
Evicted or partially offloaded pages return full current source on request. A file
edit changes its version and invalidates its old page inventory; old evidence stays
available for audit but is not presented as current. No source-read count cap is
introduced. Search results support character pagination as well as source reads.

`agent.json` separately counts source read requests, repeated source requests,
reuse receipts and page restorations. `source_chars_read` counts actually returned
source characters; a reuse receipt does not charge the source a second time.
Context records include summary attempts/successes and the retention target.

This design follows the pattern in the official DeepSeek DSH
[compaction-basic](https://github.com/deepseek-ai/deepseek-harness/tree/master/packages/compaction/compaction-basic)
and [tool-result-pruner](https://github.com/deepseek-ai/deepseek-harness/tree/master/packages/compaction/compaction-tool-result-pruner).
It is an independent ChipEvo implementation, not a claim to embed the DSH runtime.
Thresholds and page sizes are published ChipEvo defaults, not copied model limits.

## Estimated context versus measured consumption

Before a request, estimate serialized UTF-8 payload bytes at 1/3 token per byte,
plus 1024 framing allowance. Calibrate upward from actual prior input usage with
a 25% guard, independently for each candidate. This remains an estimate, not an
exact tokenizer, provider preflight count or mathematically guaranteed bound.
Confirmed-overflow recovery is necessary precisely because it is an estimate.

After each response, persist raw provider `usage` plus normalized input, output,
total, cached-input, cache-write and reasoning counts where available. Reasoning
is a subset of output and must not be added a second time. Anthropic cache read
and creation input are added to its noncached input for total-input accounting.
Missing usage remains null/incomplete. A failed request with no usage marks the
aggregate incomplete; it is never silently priced as zero.

Models do not inherently see the API response's usage metadata. The host collects
it and supplies known usage-so-far through the candidate's host-state checkpoint.
This is accounting information, not permission to access another run.

Every attempt has a purpose (`optimization`, `compaction`, or
`context_overflow_recovery`). Summarization input/output and latency are fully
charged. `usage-N.json`, `request-N.json`, `response-N.json`, `context-N.json`,
`context-events.json`, `context-archive/`, `tool-events.json`, `transcript.json`
and `agent.json` support replay and auditing. `study-report` aggregates summary
calls, recovery calls, source reads and unmetered failed requests per model/task.

Tokenizers differ, so report both token consumption and success/improvement/wall
time/tool use. Monetary cost requires explicit model/date/cache pricing; no price
is inferred from a brand name.

## Models

`gpt-6-astra` uses the official `openai_responses` adapter, with stateless manual
history replay (`store=false`, encrypted reasoning item replay). Its documented
window is 1050000 tokens; the common benchmark working-input cap still applies.
Official documentation: [model](https://developers.openai.com/api/docs/models/gpt-6-astra),
[reasoning and tool calling](https://developers.openai.com/api/docs/guides/reasoning).

Claude uses `anthropic_messages`. DeepSeek and Kimi use `openai_chat` where their
selected model supports that tool protocol. Exact Opus/DeepSeek IDs, endpoints
and capacities remain to be configured. Kimi retains official `k3` and its known
endpoint, but its model/account capacity is not guessed. `study-run` requires
explicit capacities before starting. Mock tests do not establish live connectivity.
