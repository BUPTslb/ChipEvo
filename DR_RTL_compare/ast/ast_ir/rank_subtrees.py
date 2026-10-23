#!/usr/bin/env python3
"""Rank candidate subtrees from slang-annotated timing paths."""
from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path

from granularity import (
    L_PROCESS,
    infer_semantic_tag,
    is_mutable,
    mutation_guidance,
    process_container_kind,
    risk_level,
)

DEFAULT_WEIGHTS = {
    "min_slack": 0.45,
    "path_coverage": 0.30,
    "fanout_proxy": 0.15,
    "pattern_amenability": 0.10,
}


def _norm_slack(slack: float) -> float:
    if slack >= 0:
        return 0.0
    return min(abs(slack) / 1.0, 1.0)


def _pattern_candidates(block: dict, semantic_tag: str) -> list[str]:
    kind = block.get("kind")
    if semantic_tag == "clock_reset":
        return []
    if kind == "ProceduralBlock":
        if semantic_tag == "state_update":
            return ["condition_precompute", "fsm_reencode", "register_duplication"]
        return ["condition_precompute", "register_duplication"]
    if kind == "ContinuousAssign":
        return ["mux_before_adder", "tree_balancing", "common_subexpression"]
    return []


def _primary_block(entry: dict) -> dict | None:
    blocks = entry.get("blocks") or []
    if not blocks:
        return None
    return max(blocks, key=lambda b: b.get("start_line", 0))


def _read_set(signals: set[str], symbol_nodes: list[dict]) -> list[str]:
    out = set(signals)
    for node in symbol_nodes:
        out.add(node.get("signal", ""))
    return sorted(s for s in out if s)


def rank_subtrees(
    annotated: dict,
    top_k: int,
    weights: dict,
    rank_offset: int = 0,
) -> dict:
    paths = annotated.get("annotated_paths") or []
    total = max(len(paths), 1)
    groups: dict[str, list] = defaultdict(list)

    for entry in paths:
        block = _primary_block(entry)
        if block:
            key = block["id"]
        elif entry.get("signals"):
            key = f"sig_{entry['signals'][0]}"
        else:
            continue
        groups[key].append(entry)

    subtrees = []
    for idx, (group_id, group_paths) in enumerate(groups.items()):
        slacks = [p["slack"] for p in group_paths]
        min_slack = min(slacks)
        coverage = len(group_paths) / total
        block = _primary_block(group_paths[0])
        signals: set[str] = set()
        read_symbols: list[dict] = []
        for p in group_paths:
            signals.update(p.get("signals") or [])
            read_symbols.extend(p.get("symbol_nodes") or [])

        write_set = sorted(signals)
        read_set = _read_set(signals, read_symbols)

        if block:
            proc = block.get("procedure_kind")
            semantic_tag = infer_semantic_tag(write_set, proc)
            level = L_PROCESS
            kind = process_container_kind(block)
            span = {
                "ast_type": block["kind"],
                "block_id": block["id"],
                "start_line": block["start_line"],
                "end_line": block["end_line"],
                "procedure_kind": proc,
            }
            patterns = _pattern_candidates(block, semantic_tag)
        else:
            sig = group_paths[0]["signals"][0]
            semantic_tag = infer_semantic_tag([sig], None)
            level = L_PROCESS
            kind = "signal_cluster"
            span = {"ast_type": "signal_cluster", "signal": sig}
            patterns = []

        mutable = is_mutable(level, semantic_tag, write_set)
        risk = risk_level(level, write_set, semantic_tag)
        score = (
            weights["min_slack"] * _norm_slack(min_slack)
            + weights["path_coverage"] * coverage
            + weights["fanout_proxy"] * min(len(write_set) / 10.0, 1.0)
            + weights["pattern_amenability"] * (0.8 if patterns else 0.3)
        )
        if not mutable:
            score *= 0.85

        subtrees.append(
            {
                "id": f"st_{idx:04d}",
                "score": round(score, 4),
                "level": level,
                "kind": kind,
                "min_slack": min_slack,
                "path_coverage": round(coverage, 4),
                "fanout_proxy": len(write_set),
                "span": span,
                "read_set": read_set,
                "write_set": write_set,
                "semantic_tag": semantic_tag,
                "risk_level": risk,
                "mutable": mutable,
                "mutation_guidance": mutation_guidance(level, mutable),
                "signals": write_set,
                "pattern_candidates": patterns,
                "parent_id": None,
            }
        )

    subtrees.sort(key=lambda x: x["score"], reverse=True)
    offset = max(0, rank_offset)
    return {
        "top_k": top_k,
        "weights": weights,
        "granularity_policy": {
            "default_mutation_levels": [5, 6],
            "rank_pool_level": L_PROCESS,
            "rank_offset": offset,
        },
        "subtrees": subtrees[offset : offset + top_k],
        "status": "ok" if annotated.get("status") == "ok" else annotated.get("status", "unknown"),
    }


def main() -> None:
    ap = argparse.ArgumentParser(description="Rank top-k subtrees")
    ap.add_argument("--annotated", required=True, type=Path)
    ap.add_argument("--design", required=True)
    ap.add_argument("--version", required=True)
    ap.add_argument("--top-k", type=int, default=10)
    ap.add_argument("--rank-offset", type=int, default=0)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()

    annotated = json.loads(args.annotated.read_text(encoding="utf-8"))
    ranked = rank_subtrees(annotated, args.top_k, DEFAULT_WEIGHTS, args.rank_offset)
    ranked["design"] = args.design
    ranked["version"] = args.version

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(ranked, indent=2), encoding="utf-8")
    print(f"Wrote {len(ranked['subtrees'])} subtrees: {args.out}")


if __name__ == "__main__":
    main()
