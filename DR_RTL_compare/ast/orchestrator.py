#!/usr/bin/env python3
"""
AST orchestrator — inherits DR_RTL paper loop; only analyze/optimize use AST subtree.
"""
from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
from pathlib import Path

AST_ROOT = Path(__file__).resolve().parent
COMPARE_ROOT = AST_ROOT.parent
DR_RTL_SYN = COMPARE_ROOT.parent / "DR_RTL" / "syn_flow"
sys.path.insert(0, str(DR_RTL_SYN))
import agent_runtime as ar  # noqa: E402
import skill_update as sk  # noqa: E402

try:
    import yaml
except ImportError:
    yaml = None

SYN_FLOW = AST_ROOT / "syn_flow"
DR_RTL = COMPARE_ROOT.parent / "DR_RTL"
RTL_DATASET = DR_RTL / "rtl_dataset"
RAW_MEMORY = AST_ROOT / "raw_memory"
SUITE_CFG = COMPARE_ROOT / "suite" / "suite_full20.json"
SUITE_CFG_LEGACY = COMPARE_ROOT / "suite" / "suite_designs.json"
COMPARE_YAML = COMPARE_ROOT / "compare.yaml"
BUILD = AST_ROOT / "build" / "suite_full20"
DEFAULT_EDA = AST_ROOT / "build" / "eda_workspace"
_USE_FLOCK = bool(os.environ.get("CHIP_EVO_EDA_FLOCK"))
LOG = BUILD / "logs"
AGENTS = AST_ROOT / ".claude" / "agents"
GRANULARITY_SKILL = AST_ROOT / ".claude" / "skill" / "rtl-subtree-granularity" / "skill.md"
GRANULARITY_SKILL_SUMMARY = (
    AST_ROOT / ".claude" / "skill" / "rtl-subtree-granularity" / "skill-summary.md"
)
RTL_OPT_SKILL = DR_RTL / ".claude" / "skill" / "rtl-opt" / "skill.md"
PIPELINE = AST_ROOT / "ast_ir" / "pipeline.py"

AST_DIVERSITY = [
    {"subtree_rank_offset": 0, "pattern_focus": "combinational", "coverage_first": False},
    {"subtree_rank_offset": 2, "pattern_focus": "sequential", "coverage_first": False},
    {"subtree_rank_offset": 0, "pattern_focus": "mixed", "coverage_first": True},
    {"subtree_rank_offset": 4, "pattern_focus": "combinational", "coverage_first": False},
    {"subtree_rank_offset": 6, "pattern_focus": "sequential", "coverage_first": True},
]


def log(msg: str) -> None:
    line = f"[{time.strftime('%F %T')}] {msg}"
    print(line, flush=True)
    LOG.mkdir(parents=True, exist_ok=True)
    with (LOG / "suite.log").open("a", encoding="utf-8") as f:
        f.write(line + "\n")


def load_compare_ast() -> dict:
    if yaml and COMPARE_YAML.is_file():
        data = yaml.safe_load(COMPARE_YAML.read_text(encoding="utf-8"))
        return data.get("ast") or {}
    return {}


def run_pipeline(
    design: str, best_ver: str, target_ver: str, rtl: Path, timing: Path, top_k: int, rank_offset: int
) -> Path:
    out = AST_ROOT / "artifacts" / "subtrees" / f"{design}.{target_ver}.json"
    cmd = [
        "python3",
        str(PIPELINE),
        "--rtl",
        str(rtl),
        "--timing",
        str(timing),
        "--design",
        design,
        "--version",
        target_ver,
        "--top-k",
        str(top_k),
        "--rank-offset",
        str(rank_offset),
        "--out",
        str(out),
    ]
    env = os.environ.copy()
    proc = subprocess.run(cmd, cwd=str(AST_ROOT), env=env, check=False)
    if proc.returncode != 0:
        raise RuntimeError(f"pipeline.py failed exit {proc.returncode}")
    return out


def analyze_ast(
    design: str,
    best_ver: str,
    target_ver: str,
    diversity: dict,
    ext: str,
    top_k: int,
) -> tuple[dict, Path]:
    rtl = ar.rtl_path(SYN_FLOW, design, best_ver, ext)
    timing = ar.output_dir(SYN_FLOW, design, best_ver) / "timing_word.json"
    if not timing.is_file():
        raise FileNotFoundError(f"Missing timing: {timing}")

    rank_offset = diversity.get("subtree_rank_offset", 0)
    subtrees_path = run_pipeline(design, best_ver, target_ver, rtl, timing, top_k, rank_offset)
    subtrees_doc = ar.load_json(subtrees_path)
    ppa = ar.read_ppa(SYN_FLOW, design, best_ver)

    iter_doc = {
        "analysis_mode": "ast_subtree",
        "design": design,
        "base_version": best_ver,
        "target_version": target_ver,
        "diversity_strategy": diversity,
        "granularity_policy": subtrees_doc.get("granularity_policy"),
        "granularity_skill": str(GRANULARITY_SKILL),
        "wns_before": ppa.get("WNS"),
        "tns_before": ppa.get("TNS"),
        "area_baseline": None,  # filled by caller from v0 baseline
        "critical_subtrees": subtrees_doc.get("subtrees", []),
        "subtree_file": str(subtrees_path),
    }
    return iter_doc, subtrees_path


def _eda_root() -> str:
    return os.environ.get("CHIP_EVO_EDA_ROOT", str(DEFAULT_EDA))


def _signal_text(value) -> str:
    """Normalize target_signal (may be list when several signals are touched)."""
    if value is None:
        return "ast_subtree"
    if isinstance(value, (list, tuple)):
        joined = "+".join(str(v) for v in value if v not in (None, ""))
        return joined or "ast_subtree"
    return str(value)


def _build_optimization_trajectory(rewrite: dict | None, subtrees: list) -> list[dict]:
    if not rewrite:
        return []
    pid = rewrite.get("pattern_id", "unknown")
    return [{
        "subtree_id": (rewrite.get("subtree_ids") or ["?"])[0],
        "pattern": _signal_text(rewrite.get("target_signal")),
        "strategy": pid,
        "skill_source": rewrite.get("skill_source", "proposed"),
        "pattern_id": pid,
    }]


def load_granularity_summary() -> str:
    if GRANULARITY_SKILL_SUMMARY.is_file():
        return ar.load_md_body(GRANULARITY_SKILL_SUMMARY)
    return "\n".join(ar.load_md_body(GRANULARITY_SKILL).splitlines()[:80])


def optimize_ast(
    design: str,
    base_ver: str,
    target_ver: str,
    analysis: dict,
    subtrees_path: Path,
    ext: str,
    model: str,
) -> tuple[str, dict | None]:
    if not GRANULARITY_SKILL.is_file():
        raise FileNotFoundError(f"Granularity skill required: {GRANULARITY_SKILL}")

    agent = ar.load_md_body(AGENTS / "rtl-ast-optimizer.md")
    granularity = load_granularity_summary()
    rtl_opt = ar.load_md_body(RTL_OPT_SKILL) if RTL_OPT_SKILL.is_file() else ""
    overlay = sk.overlay_path(SYN_FLOW)
    if overlay.is_file():
        rtl_opt += "\n\n" + overlay.read_text(encoding="utf-8")
    subtrees = ar.load_json(subtrees_path)

    system = (
        f"{agent}\n\n"
        f"=== REQUIRED: RTL Subtree Granularity Skill (summary) ===\n\n{granularity}\n\n"
        f"=== RTL Optimization Skill (reference) ===\n\n{rtl_opt}"
    )

    rtl = ar.rtl_path(SYN_FLOW, design, base_ver, ext).read_text(encoding="utf-8")
    mutable = [t for t in subtrees.get("subtrees", []) if t.get("mutable") is not False][:3]
    if not mutable:
        mutable = subtrees.get("subtrees", [])[:2]

    user = (
        f"Design: {design}\nBase: {base_ver}\nTarget: {target_ver}\n\n"
        f"You MUST follow the granularity skill: L2 containers are NOT directly mutable; "
        f"decompose to L5 assignment-slices before applying rtl-opt transforms.\n\n"
        f"Analysis iter.json:\n```json\n{json.dumps(analysis, indent=2)}\n```\n\n"
        f"Ranked subtrees:\n```json\n{json.dumps(mutable, indent=2)}\n```\n\n"
        f"Current RTL:\n```verilog\n{rtl}\n```\n\n"
        "Deliver:\n"
        "1. COMPLETE optimized Verilog in ```verilog block\n"
        "2. Rewrite log ```json with subtree_ids, refined_level, target_signal, pattern_id, lines_touched, span_refined"
    )

    new_rtl, reply = ar.extract_verilog_with_retry(model, system, user)
    rewrite = ar.extract_json_block(reply)
    return new_rtl, rewrite


def run_design(design: str, cfg: dict, design_all: dict, ast_cfg: dict) -> dict:
    ext = ar.design_ext(design_all, design)
    num_majors = cfg["num_majors"]
    num_minors = cfg["minors_per_major"]
    model = cfg.get("mimo_model", os.environ.get("MIMO_MODEL", "mimo-v2.5-pro"))
    top_k = ast_cfg.get("top_k_subtrees", 10)

    log(f"=== DESIGN START: {design} (AST) ===")
    log(f"Granularity skill: {GRANULARITY_SKILL} (prompt uses summary)")
    sk.import_bootstrap(SYN_FLOW, RTL_OPT_SKILL)
    ar.skill_dir(SYN_FLOW).mkdir(parents=True, exist_ok=True)
    eda = _eda_root()
    ar.seed_v0(SYN_FLOW, RTL_DATASET, design_all, design)
    if ar.run_evaluate(SYN_FLOW, design, "v0", eda_root=eda, rtl_dataset=RTL_DATASET, use_flock=_USE_FLOCK) != 0:
        log(f"ERROR: v0 evaluate failed for {design}")
        return {"design": design, "status": "v0_failed"}

    baseline_ppa = ar.read_ppa(SYN_FLOW, design, "v0")
    history_path = SYN_FLOW / "history" / f"{design}.history.json"
    history = {
        "design": design,
        "track": "ast_subtree",
        "baseline": baseline_ppa,
        "best_version": "v0",
        "best_ppa": baseline_ppa,
        "best_score": None,
        "end_reason": None,
        "major_rounds": [],
    }
    ar.save_json(history_path, history)
    best_ver = "v0"
    best_score = None
    rewrites_dir = AST_ROOT / "artifacts" / "rewrites"
    rewrites_dir.mkdir(parents=True, exist_ok=True)

    for major in range(num_majors):
        round_rec = {"major_version": ar.major_label(major), "minors": [], "promoted_to": None}
        history["major_rounds"].append(round_rec)
        ar.save_json(history_path, history)
        minor_candidates = []

        for minor in range(1, num_minors + 1):
            target = ar.minor_label(major, minor)
            div = {**AST_DIVERSITY[minor - 1], "minor_index": minor}
            log(f"{design}: major={major} minor={minor} ({target}) rank_offset={div['subtree_rank_offset']}")

            iter_path = SYN_FLOW / "log" / f"{design}.{target}.iter.json"
            try:
                analysis, subtrees_path = analyze_ast(design, best_ver, target, div, ext, top_k)
                analysis["area_baseline"] = baseline_ppa.get("Area")
                new_rtl, rewrite = optimize_ast(
                    design, best_ver, target, analysis, subtrees_path, ext, model
                )
                rtl_out = ar.rtl_path(SYN_FLOW, design, target, ext)
                rtl_out.write_text(new_rtl, encoding="utf-8")
                ok, slang_msg = ar.validate_rtl_slang(rtl_out, required=True)
                if not ok:
                    log(f"  RTL syntax check failed: {slang_msg[:300]}")
                    ar.save_json(
                        iter_path,
                        {"error": f"rtl_syntax: {slang_msg[:500]}", "target_version": target},
                    )
                    round_rec["minors"].append(
                        {"version": target, "sec": "fail", "score": None, "promoted": False}
                    )
                    ar.save_json(history_path, history)
                    continue
                if rewrite:
                    analysis["rewrite"] = rewrite
                    analysis["optimization_trajectory"] = _build_optimization_trajectory(
                        rewrite, analysis.get("critical_subtrees", [])
                    )
                    ar.save_json(rewrites_dir / f"{design}.{target}.json", rewrite)
                ar.save_json(iter_path, analysis)
            except Exception as exc:
                log(f"  failed: {exc}")
                ar.save_json(iter_path, {"error": str(exc), "target_version": target})
                round_rec["minors"].append(
                    {"version": target, "sec": "fail", "score": None, "promoted": False}
                )
                ar.save_json(history_path, history)
                continue

            if ar.run_evaluate(SYN_FLOW, design, target, eda_root=eda, rtl_dataset=RTL_DATASET, use_flock=_USE_FLOCK) != 0:
                round_rec["minors"].append(
                    {"version": target, "sec": "fail", "score": None, "promoted": False}
                )
                ar.save_json(history_path, history)
                continue

            sec = ar.read_sec(SYN_FLOW, design, target)
            ppa = ar.read_ppa(SYN_FLOW, design, target)
            sec_ok = sec and "PASSED" in sec.upper()
            synth_ok = sec_ok and ar.ppa_complete(ppa)
            if sec_ok and not synth_ok:
                log("  sec=pass synth=fail")
            scoring = ar.compute_scoring_breakdown(ppa, baseline_ppa)
            score = scoring["score"] if synth_ok else None
            analysis["evaluation"] = {
                "sec_status": "pass" if sec_ok else "fail",
                "synth_status": "pass" if synth_ok else ("fail" if sec_ok else "skip"),
                "wns_after": ppa.get("WNS"),
                "tns_after": ppa.get("TNS"),
                "area": ppa.get("Area"),
            }
            analysis["scoring"] = scoring
            ar.save_json(iter_path, analysis)

            rec = {
                "version": target,
                "sec": "pass" if synth_ok else "fail",
                "score": score,
                "promoted": False,
            }
            round_rec["minors"].append(rec)
            ar.save_json(history_path, history)
            if synth_ok and score is not None:
                minor_candidates.append((score, target))
            log(f"  sec={rec['sec']} score={score}")

        try:
            group_doc = sk.learn_from_group(
                SYN_FLOW, design, major, round_rec, log_dir=SYN_FLOW / "log"
            )
            sk.merge_group_into_library(SYN_FLOW, group_doc)
        except Exception as exc:
            log(f"  WARNING: skill learning failed for {design} major {major}: {exc}")

        if not minor_candidates:
            history["end_reason"] = "no_improvement"
            ar.save_json(history_path, history)
            log(f"{design}: no SEC-pass scored minor in major {major}, stopping")
            break

        minor_candidates.sort(key=lambda x: x[0])
        best_minor_score, best_minor_ver = minor_candidates[0]
        for m in round_rec["minors"]:
            m["promoted"] = m["version"] == best_minor_ver

        next_major = ar.major_label(major + 1)
        ar.promote_rtl(
            ar.rtl_path(SYN_FLOW, design, best_minor_ver, ext),
            ar.rtl_path(SYN_FLOW, design, next_major, ext),
        )
        round_rec["promoted_to"] = next_major
        best_ver = next_major
        ar.save_json(history_path, history)
        if ar.run_evaluate(SYN_FLOW, design, next_major, eda_root=eda, rtl_dataset=RTL_DATASET, use_flock=_USE_FLOCK) != 0:
            log(f"ERROR: post-promote evaluate failed for {design}.{next_major}, stopping")
            history["end_reason"] = "promote_evaluate_failed"
            ar.save_json(history_path, history)
            break
        promoted_ppa = ar.read_ppa(SYN_FLOW, design, next_major)
        if best_score is None or best_minor_score < best_score:
            best_score = best_minor_score
            history["best_score"] = best_score
            history["best_version"] = best_ver
            history["best_ppa"] = promoted_ppa
        log(f"{design}: promoted {best_minor_ver} → {next_major} score={best_minor_score}")
        ar.save_json(history_path, history)

        if major + 1 >= num_majors:
            history["end_reason"] = "max_major_reached"
            ar.save_json(history_path, history)
            break

    ar.save_json(history_path, history)
    summary = {
        "design": design,
        "status": "done",
        "best_version": history["best_version"],
        "best_score": history["best_score"],
        "end_reason": history["end_reason"],
    }
    ar.save_json(BUILD / f"{design}_summary.json", summary)
    log(f"=== DESIGN DONE: {design} best={history['best_version']} ===")
    return summary


def main() -> None:
    ap = argparse.ArgumentParser(description="DR_RTL_compare AST full20 orchestrator")
    ap.add_argument("--suite", default="full20", help="full20 or path to JSON config")
    ap.add_argument("--config", type=Path, help="Override suite JSON")
    ap.add_argument("--design", help="Single design only")
    ap.add_argument(
        "--start-from",
        help="Resume: run from this design (inclusive) in the suite design order",
    )
    args = ap.parse_args()

    cfg_path = args.config
    if cfg_path is None:
        if args.suite == "full20" and SUITE_CFG.is_file():
            cfg_path = SUITE_CFG
        elif SUITE_CFG_LEGACY.is_file():
            cfg_path = SUITE_CFG_LEGACY
        else:
            cfg_path = SUITE_CFG
    cfg = ar.load_json(cfg_path)
    ast_cfg = load_compare_ast()
    design_all = ar.load_json(SYN_FLOW / "design_all.json")
    all_designs = cfg["designs"]
    if args.design:
        designs = [args.design]
    elif args.start_from:
        if args.start_from not in all_designs:
            ap.error(f"--start-from '{args.start_from}' not in suite designs: {all_designs}")
        designs = all_designs[all_designs.index(args.start_from):]
        log(f"RESUME: starting from {args.start_from}, running {len(designs)} designs")
    else:
        designs = all_designs

    BUILD.mkdir(parents=True, exist_ok=True)
    LOG.mkdir(parents=True, exist_ok=True)
    (SYN_FLOW / "log").mkdir(exist_ok=True)
    (SYN_FLOW / "history").mkdir(exist_ok=True)

    for d in designs:
        if d not in design_all:
            log(f"SKIP unknown design: {d}")
            continue
        try:
            run_design(d, cfg, design_all, ast_cfg)
        except Exception as exc:
            log(f"ERROR: design {d} crashed, continuing with next: {exc}")
            ar.save_json(
                BUILD / f"{d}_summary.json",
                {"design": d, "status": "crashed", "error": str(exc)},
            )

    suite_summary = {
        "track": "ast_subtree",
        "granularity_skill": str(GRANULARITY_SKILL),
        "designs": [],
        "started": time.strftime("%F %T"),
    }
    for d in all_designs:
        summ_path = BUILD / f"{d}_summary.json"
        if summ_path.is_file():
            suite_summary["designs"].append(ar.load_json(summ_path))
    suite_summary["finished"] = time.strftime("%F %T")
    ar.save_json(BUILD / "suite_summary.json", suite_summary)
    sk.archive_attempt(SYN_FLOW, RAW_MEMORY, time.strftime("%Y%m%d_%H%M%S"))
    log("SUITE COMPLETE")


if __name__ == "__main__":
    main()
