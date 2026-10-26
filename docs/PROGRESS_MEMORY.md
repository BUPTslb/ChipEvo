# Progress memory protocol v5

This version applies identically to every provider. It does not change RTL,
libraries, synthesis, STA, equivalence, scoring, reasoning options or API/time
budgets. The added state and ordinary-progress instruction change the agent
protocol; v4 and v5 experiments must not be merged without version labels.

## Authoritative facts

`agent/progress.json` records a deterministic hash of all candidate RTL file
hashes, applied edits, the evaluated version, feedback allowance and remaining
active seconds. Host facts are sent to both the optimizer and summarizer and
override advisory memory. Their hash schema is internal and is not interchangeable
with study parent hashes. All candidate files are hashed initially; successful
host-mediated edits update changed entries. No external file tools are exposed.

An evaluation creates `agent/evaluated-rtl-N/` before EDA. Its record contains
`evaluated_rtl_hash` and the snapshot path. Following edits make
`applies_to_current_rtl` false. Even a PASS/resolved result then belongs to an
older version, never to the new candidate. Returning to exactly that version
restores applicability. Failed evaluations remain failures, consume their
existing feedback allowance and preserve their version/snapshot. The framework
does not silently revert or submit an older snapshot for the model.

## Advisory memory and source retention

Summary requests receive current facts separately from bounded archived excerpts
and prior advisory decisions. Excerpts are explicitly partial. Edit/evaluation
records have priority over read logs. Keep the decisions/pending-action head
instead of a growing tail of references. Native reasoning remains intact in
active provider history; it is not copied into progress notes or recall views.
Providers keep their existing main and summary reasoning options and token caps.
Semantic summaries can still be inaccurate; host facts remain independent.

Two recent current-version source references are preferred during pruning and
group removal. The soft retain target may be exceeded while below the pressure
trigger to keep a useful working page. The hard input limit still wins; no
unbounded source pinning or cross-candidate memory is introduced.

`recall_history` pages a stable decoded projection (`decoded-evidence-v1`). It
removes private reasoning, unpacks message/source/result wrappers and limits
nested decoding depth. Original archives remain immutable for auditing. Recovery
text is excluded from summary digests, which retain its reference/offset instead.
This prevents repeated ingestion of nested histories. Pagination offsets refer
to the decoded projection and remain stable for the same reference. Older raw
pagination offsets must not be reused as though they belonged to this version.

## Validation boundaries

`tests/test_progress_memory.py` covers partial old history versus applied edits,
failed summary fallback, version-bound feedback after later changes, evaluation
snapshot preservation, nested recall sanitization, important digest facts and
working-page retention/invalidation. Other context, provider, gate and timing
regressions remain required. Test providers and EDA feedback are mocks; these
tests launch no model calls or real-design EDA. New live acceptance and fresh
experiments require explicit user authorization. Existing v4 releases, runs,
results and upload bundles stay immutable and do not gain v5 behavior in place.
