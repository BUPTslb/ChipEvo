"""Deterministic request budgeting; the complete transcript stays on disk.

The dependency-free counter deliberately charges one unit per UTF-8 JSON byte,
plus framing allowance. This is a conservative estimate, NOT a provider tokenizer
or a universal mathematical token bound. Actual API usage is recorded separately.
"""
import json
from .providers import payload


class ContextLimitError(ValueError):
    pass


def input_limit(model, budget):
    cap = budget['max_estimated_input_tokens']
    window = model.get('context_window_tokens')
    if window is not None:
        cap = min(cap, window - budget['max_output_tokens'] - budget['context_safety_tokens'])
    if cap <= 0:
        raise ContextLimitError('Context window cannot reserve output and safety budget')
    return cap


def estimate(body):
    # Count the actual protocol payload, including schemas/options/reasoning blocks.
    return len(json.dumps(body, ensure_ascii=False, separators=(',', ':')).encode('utf-8')) + 1024


def groups(messages):
    """Assistant tool calls and ALL matching results are indivisible."""
    out = []; i = 0
    while i < len(messages):
        message = messages[i]
        if message['role'] == 'tool':
            raise ContextLimitError('Orphan tool result in transcript')
        group = [message]; i += 1
        calls = message.get('tool_calls') or []
        if calls:
            expected = {c['id'] for c in calls}; seen = set()
            if len(expected) != len(calls):
                raise ContextLimitError('Duplicate tool call IDs')
            while i < len(messages) and messages[i]['role'] == 'tool':
                result = messages[i]; ident = result['tool_call_id']
                if ident not in expected or ident in seen:
                    raise ContextLimitError('Mismatched tool result')
                seen.add(ident); group.append(result); i += 1
            if seen != expected:
                raise ContextLimitError('Incomplete tool roundtrip')
        out.append(group)
    return out


def prepare(model, history, schema, budget, state_summary):
    """Keep immutable system/task, bounded host state and newest complete groups.

    No in-place trimming, no model-generated summaries, no extra API calls. An
    oversized pinned prompt or latest group fails BEFORE contacting the provider.
    """
    cap = input_limit(model, budget)
    pinned = history[:2]
    tail = groups(history[2:])
    removed = 0
    before = estimate(payload(model, history, schema, budget['max_output_tokens']))
    while True:
        note = []
        if removed:
            note = [{'role': 'user', 'content':
                     'CONTEXT CHECKPOINT: older complete interactions omitted from this request. '
                     'The task above is unchanged. Current candidate files are authoritative; '
                     're-read source before edits if needed. No other candidate history is available. '
                     + json.dumps(state_summary, ensure_ascii=False, separators=(',', ':'))}]
        selected = pinned + note + [m for g in tail[removed:] for m in g]
        body = payload(model, selected, schema, budget['max_output_tokens'])
        size = estimate(body)
        if size <= cap:
            return body, {'counter': 'utf8_json_bytes_plus_1024_estimate',
                          'estimated_input_before': before, 'estimated_input_after': size,
                          'effective_input_limit': cap, 'removed_groups': removed,
                          'retained_groups': len(tail)-removed,
                          'output_reserve_tokens': budget['max_output_tokens'],
                          'context_window_tokens': model.get('context_window_tokens'),
                          'provider_window_verified': model.get('context_window_tokens') is not None}
        # Keep the newest group, including any provider-native thinking/signature.
        if removed >= max(0, len(tail)-1):
            raise ContextLimitError('context_limit_exceeded: fixed task/schema and latest complete interaction '
                                    f'need estimated {size}, available {cap}; no API request sent')
        removed += 1
