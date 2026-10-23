#!/usr/bin/env python3
"""Generate markdown case-study report from compare_trajectories outputs."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def pick_cases(per_design_dir: Path) -> tuple[list[dict], list[dict]]:
    ast_wins, path_wins = [], []
    for path in sorted(per_design_dir.glob("*.trajectory.json")):
        doc = json.loads(path.read_text(encoding="utf-8"))
        ps = doc.get("path_best", {}).get("score")
        as_ = doc.get("ast_best", {}).get("score")
        if ps is None and as_ is None:
            continue
        entry = {
            "design": doc.get("design", path.stem.replace(".trajectory", "")),
            "path_score": ps,
            "ast_score": as_,
            "path_ppa": doc.get("path_best", {}).get("ppa"),
            "ast_ppa": doc.get("ast_best", {}).get("ppa"),
            "path_end": doc.get("path_best", {}).get("end_reason"),
            "ast_end": doc.get("ast_best", {}).get("end_reason"),
        }
        if as_ is not None and (ps is None or as_ < ps):
            ast_wins.append(entry)
        elif ps is not None and (as_ is None or ps < as_):
            path_wins.append(entry)
    ast_wins.sort(key=lambda x: (x["ast_score"] or 0) - (x["path_score"] or 0))
    path_wins.sort(key=lambda x: (x["path_score"] or 0) - (x["ast_score"] or 0))
    return ast_wins[:2], path_wins[:2]


def fmt_ppa(ppa: dict | None) -> str:
    if not ppa:
        return "n/a"
    return f"WNS={ppa.get('WNS', 'n/a')} TNS={ppa.get('TNS', 'n/a')} Area={ppa.get('Area', 'n/a')}"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--results", type=Path, default=Path(__file__).resolve().parent.parent / "results" / "full20")
    ap.add_argument("--out", type=Path, default=None)
    args = ap.parse_args()
    per_design = args.results / "per_design"
    out = args.out or (args.results / "case_study.md")

    summary_path = args.results / "suite_summary.json"
    summary = json.loads(summary_path.read_text()) if summary_path.is_file() else {}

    ast_cases, path_cases = pick_cases(per_design) if per_design.is_dir() else ([], [])

    lines = [
        "# DR_RTL vs AST — Case Study",
        "",
        "## Suite summary",
        "",
        f"- Designs compared: {summary.get('design_count', 0)}",
        f"- Path wins: {summary.get('path_wins', 0)} | AST wins: {summary.get('ast_wins', 0)} | Ties: {summary.get('ties', 0)}",
        f"- Mean best_score — path: {summary.get('path_best_score_mean', 'n/a')} | ast: {summary.get('ast_best_score_mean', 'n/a')}",
        f"- Mean sec_pass_rate — path: {summary.get('path_sec_pass_rate_mean', 'n/a')} | ast: {summary.get('ast_sec_pass_rate_mean', 'n/a')}",
        "",
        "## AST wins (top examples)",
        "",
    ]
    if not ast_cases:
        lines.append("_No AST win cases yet (full20 may still be running)._")
    for c in ast_cases:
        lines.extend([
            f"### {c['design']}",
            f"- Path score: {c['path_score']} ({fmt_ppa(c['path_ppa'])}) end={c['path_end']}",
            f"- AST score: {c['ast_score']} ({fmt_ppa(c['ast_ppa'])}) end={c['ast_end']}",
            f"- Inspect: `per_design/{c['design']}.trajectory.json`",
            f"- Path iter logs: `DR_RTL/syn_flow/log/{c['design']}.*.iter.json`",
            f"- AST iter logs: `DR_RTL_compare/ast/syn_flow/log/{c['design']}.*.iter.json`",
            f"- AST subtrees: `DR_RTL_compare/ast/artifacts/subtrees/{c['design']}.*.json`",
            "",
        ])

    lines.append("## Path wins (top examples)")
    lines.append("")
    if not path_cases:
        lines.append("_No path win cases yet._")
    for c in path_cases:
        lines.extend([
            f"### {c['design']}",
            f"- Path score: {c['path_score']} ({fmt_ppa(c['path_ppa'])}) end={c['path_end']}",
            f"- AST score: {c['ast_score']} ({fmt_ppa(c['ast_ppa'])}) end={c['ast_end']}",
            f"- Inspect: `per_design/{c['design']}.trajectory.json`",
            "",
        ])

    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
