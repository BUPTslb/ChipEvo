#!/usr/bin/env python3
"""Aggregate baseline vs AST experiment results into results/reports/summary.json."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


def load_ppa(result_dir: Path) -> dict | None:
    ppa = result_dir / "eda_output" / "PPA_report.json"
    if not ppa.is_file():
        ppa = result_dir / "PPA_report.json"
    if not ppa.is_file():
        return None
    return json.loads(ppa.read_text())


def load_sec(result_dir: Path) -> str | None:
    sec = result_dir / "eda_output" / "SEC_result.txt"
    if not sec.is_file():
        sec = result_dir / "SEC_result.txt"
    if not sec.is_file():
        return None
    return sec.read_text().strip()


def scan_track(results_root: Path) -> list[dict]:
    rows = []
    if not results_root.is_dir():
        return rows
    for design_dir in sorted(results_root.iterdir()):
        if not design_dir.is_dir() or design_dir.name.startswith("_"):
            continue
        for version_dir in sorted(design_dir.iterdir()):
            if not version_dir.is_dir():
                continue
            ppa = load_ppa(version_dir)
            sec = load_sec(version_dir)
            rows.append({
                "design": design_dir.name,
                "version": version_dir.name,
                "track": results_root.name,
                "ppa": ppa,
                "sec": sec,
                "path": str(version_dir),
            })
    return rows


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--suite", default="pilot")
    ap.add_argument("--root", type=Path, default=Path(__file__).resolve().parent.parent)
    args = ap.parse_args()

    compare_root = args.root
    baseline = scan_track(compare_root / "results" / "baseline")
    ast = scan_track(compare_root / "results" / "ast")

    out_dir = compare_root / "results" / "reports"
    out_dir.mkdir(parents=True, exist_ok=True)
    summary = {
        "suite": args.suite,
        "baseline_runs": len(baseline),
        "ast_runs": len(ast),
        "baseline": baseline,
        "ast": ast,
    }
    out_path = out_dir / f"summary_{args.suite}.json"
    out_path.write_text(json.dumps(summary, indent=2))
    print(f"Wrote {out_path} ({len(baseline)} baseline, {len(ast)} ast runs)")


if __name__ == "__main__":
    main()
