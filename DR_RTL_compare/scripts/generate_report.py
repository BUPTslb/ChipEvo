#!/usr/bin/env python3
"""Generate markdown comparison report from aggregate_results summary JSON."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def score_from_ppa(ppa: dict | None, scoring: dict) -> float | None:
    if not ppa or ppa.get("WNS") is None:
        return None
    # Placeholder: full score needs v0 baseline per design from history
    return None


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--suite", default="pilot")
    ap.add_argument("--root", type=Path, default=Path(__file__).resolve().parent.parent)
    ap.add_argument("--out", type=Path, default=None)
    args = ap.parse_args()

    summary_path = args.root / "results" / "reports" / f"summary_{args.suite}.json"
    if not summary_path.is_file():
        print(f"Run aggregate_results.py first. Missing {summary_path}")
        return

    summary = json.loads(summary_path.read_text())
    out = args.out or (args.root / "results" / "reports" / f"compare_{args.suite}.md")

    lines = [
        f"# DR_RTL vs AST Comparison — {args.suite}",
        "",
        f"- Baseline runs: {summary['baseline_runs']}",
        f"- AST runs: {summary['ast_runs']}",
        "",
        "## Per-run SEC status",
        "",
        "| Track | Design | Version | SEC | WNS | TNS | Area |",
        "|-------|--------|---------|-----|-----|-----|------|",
    ]

    for track_key in ("baseline", "ast"):
        for row in summary.get(track_key, []):
            ppa = row.get("ppa") or {}
            lines.append(
                f"| {track_key} | {row['design']} | {row['version']} | {row.get('sec', '-')} "
                f"| {ppa.get('WNS', '-')} | {ppa.get('TNS', '-')} | {ppa.get('Area', '-')} |"
            )

    lines.extend([
        "",
        "## Next steps",
        "",
        "- Wire `best_score` once history.json snapshots are ingested",
        "- Add AST-only columns: subtree_coverage, pattern_hit_rate",
        "",
    ])

    out.write_text("\n".join(lines))
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
