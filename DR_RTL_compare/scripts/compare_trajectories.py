#!/usr/bin/env python3
"""Step-by-step path vs AST trajectory comparison from history.json files."""
from __future__ import annotations

import argparse
import json
import statistics
from pathlib import Path


def load_history(path: Path) -> dict | None:
    if path.is_file():
        return json.loads(path.read_text(encoding="utf-8"))
    return None


def major_trajectory(history: dict) -> list[dict]:
    rows = []
    baseline = history.get("baseline") or {}
    for rnd in history.get("major_rounds") or []:
        promoted = rnd.get("promoted_to")
        minors = rnd.get("minors") or []
        sec_pass = sum(1 for m in minors if m.get("sec") == "pass")
        best_minor = None
        for m in minors:
            if m.get("promoted"):
                best_minor = m
                break
        ppa = history.get("best_ppa") if promoted else None
        rows.append({
            "major": rnd.get("major_version"),
            "promoted_to": promoted,
            "sec_pass_rate": sec_pass / max(len(minors), 1),
            "best_minor_score": best_minor.get("score") if best_minor else None,
            "best_version": history.get("best_version") if promoted else rnd.get("major_version"),
            "wns": (ppa or {}).get("WNS"),
            "tns": (ppa or {}).get("TNS"),
            "area": (ppa or {}).get("Area"),
            "baseline_wns": baseline.get("WNS"),
        })
    return rows


def sec_pass_rate(history: dict | None) -> float | None:
    if not history:
        return None
    total = 0
    passed = 0
    for rnd in history.get("major_rounds") or []:
        for m in rnd.get("minors") or []:
            total += 1
            if m.get("sec") == "pass":
                passed += 1
    return passed / total if total else None


def majors_with_promotion(history: dict | None) -> int:
    if not history:
        return 0
    return sum(1 for r in history.get("major_rounds") or [] if r.get("promoted_to"))


def compare_design(path_hist: dict | None, ast_hist: dict | None) -> dict:
    path_rows = major_trajectory(path_hist) if path_hist else []
    ast_rows = major_trajectory(ast_hist) if ast_hist else []
    n = max(len(path_rows), len(ast_rows))
    paired = []
    for i in range(n):
        pr = path_rows[i] if i < len(path_rows) else {}
        ar = ast_rows[i] if i < len(ast_rows) else {}
        paired.append({
            "major_index": i,
            "path": pr,
            "ast": ar,
        })
    return {
        "path_best": {
            "version": (path_hist or {}).get("best_version"),
            "score": (path_hist or {}).get("best_score"),
            "ppa": (path_hist or {}).get("best_ppa"),
            "end_reason": (path_hist or {}).get("end_reason"),
        },
        "ast_best": {
            "version": (ast_hist or {}).get("best_version"),
            "score": (ast_hist or {}).get("best_score"),
            "ppa": (ast_hist or {}).get("best_ppa"),
            "end_reason": (ast_hist or {}).get("end_reason"),
        },
        "majors": paired,
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--chip-evo-root", type=Path, default=Path(__file__).resolve().parents[2])
    ap.add_argument("--out", type=Path, default=None)
    ap.add_argument("--path-hist-dir", type=Path, default=None)
    ap.add_argument("--ast-hist-dir", type=Path, default=None)
    args = ap.parse_args()
    root = args.chip_evo_root
    out = args.out or (root / "DR_RTL_compare" / "results" / "full20")
    out.mkdir(parents=True, exist_ok=True)

    path_hist_dir = args.path_hist_dir or (root / "DR_RTL" / "syn_flow" / "history")
    ast_hist_dir = args.ast_hist_dir or (root / "DR_RTL_compare" / "ast" / "syn_flow" / "history")
    designs = sorted(
        {p.stem.replace(".history", "") for p in path_hist_dir.glob("*.history.json")}
        | {p.stem.replace(".history", "") for p in ast_hist_dir.glob("*.history.json")}
    )

    suite: dict = {
        "designs": [],
        "path_wins": 0,
        "ast_wins": 0,
        "ties": 0,
        "per_design": [],
    }
    path_scores: list[float] = []
    ast_scores: list[float] = []
    path_sec_rates: list[float] = []
    ast_sec_rates: list[float] = []

    for design in designs:
        ph = load_history(path_hist_dir / f"{design}.history.json")
        ah = load_history(ast_hist_dir / f"{design}.history.json")
        doc = compare_design(ph, ah)
        doc["design"] = design
        doc["path_sec_pass_rate"] = sec_pass_rate(ph)
        doc["ast_sec_pass_rate"] = sec_pass_rate(ah)
        doc["path_majors_promoted"] = majors_with_promotion(ph)
        doc["ast_majors_promoted"] = majors_with_promotion(ah)
        (out / "per_design" / f"{design}.trajectory.json").parent.mkdir(parents=True, exist_ok=True)
        (out / "per_design" / f"{design}.trajectory.json").write_text(
            json.dumps(doc, indent=2) + "\n", encoding="utf-8"
        )
        suite["designs"].append(design)
        ps = doc["path_best"].get("score")
        as_ = doc["ast_best"].get("score")
        if ps is not None:
            path_scores.append(ps)
        if as_ is not None:
            ast_scores.append(as_)
        pr = doc["path_sec_pass_rate"]
        ar = doc["ast_sec_pass_rate"]
        if pr is not None:
            path_sec_rates.append(pr)
        if ar is not None:
            ast_sec_rates.append(ar)

        winner = "tie"
        if ps is None and as_ is None:
            suite["ties"] += 1
        elif ps is not None and (as_ is None or ps < as_):
            suite["path_wins"] += 1
            winner = "path"
        elif as_ is not None and (ps is None or as_ < ps):
            suite["ast_wins"] += 1
            winner = "ast"
        else:
            suite["ties"] += 1

        suite["per_design"].append({
            "design": design,
            "winner": winner,
            "path_best_score": ps,
            "ast_best_score": as_,
            "path_sec_pass_rate": pr,
            "ast_sec_pass_rate": ar,
            "path_end_reason": doc["path_best"].get("end_reason"),
            "ast_end_reason": doc["ast_best"].get("end_reason"),
        })

    def _mean(vals: list[float]) -> float | None:
        return statistics.mean(vals) if vals else None

    def _median(vals: list[float]) -> float | None:
        return statistics.median(vals) if vals else None

    summary = {
        "design_count": len(designs),
        "path_wins": suite["path_wins"],
        "ast_wins": suite["ast_wins"],
        "ties": suite["ties"],
        "path_best_score_mean": _mean(path_scores),
        "path_best_score_median": _median(path_scores),
        "ast_best_score_mean": _mean(ast_scores),
        "ast_best_score_median": _median(ast_scores),
        "path_sec_pass_rate_mean": _mean(path_sec_rates),
        "ast_sec_pass_rate_mean": _mean(ast_sec_rates),
        "designs_with_path_score": len(path_scores),
        "designs_with_ast_score": len(ast_scores),
    }
    suite["summary"] = summary

    (out / "suite_win_tie_loss.json").write_text(json.dumps(suite, indent=2) + "\n", encoding="utf-8")
    (out / "suite_summary.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote trajectory comparison to {out}")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
