#!/usr/bin/env python3
"""AST track: local DC + SEC via isolated EDA workspace (parallel-safe vs baseline)."""
from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys

SYN_FLOW = os.path.dirname(os.path.abspath(__file__))
AST_ROOT = os.path.dirname(SYN_FLOW)
COMPARE_ROOT = os.path.dirname(AST_ROOT)
DR_RTL = os.path.join(COMPARE_ROOT, "..", "DR_RTL")
RTL_DATASET = os.path.join(DR_RTL, "rtl_dataset")
DEFAULT_AST_EDA = os.path.join(AST_ROOT, "build", "eda_workspace")


def _eda_root() -> str:
    return os.environ.get("CHIP_EVO_EDA_ROOT", DEFAULT_AST_EDA)


def _load_ext(design: str) -> str:
    with open(os.path.join(SYN_FLOW, "design_all.json"), encoding="utf-8") as f:
        return json.load(f)[design][3]


def _ensure_rtl(design: str, version: str, ext: str) -> str:
    rtl = os.path.join(SYN_FLOW, "rtl", f"{design}.{version}.{ext}")
    if os.path.isfile(rtl):
        return rtl
    seed = os.path.join(RTL_DATASET, f"{design}.v0.{ext}")
    if not os.path.isfile(seed):
        raise FileNotFoundError(f"RTL missing: {rtl}")
    os.makedirs(os.path.dirname(rtl), exist_ok=True)
    shutil.copy2(seed, rtl)
    print(f"Seeded RTL: {rtl}")
    return rtl


def _run_post_evaluate_pipeline(
    design: str, version: str, rtl_src: str, timing: str
) -> None:
    """Optional subtree precompute; failures must not fail evaluate."""
    subtree_out = os.path.join(AST_ROOT, "artifacts", "subtrees", f"{design}.{version}.json")
    pipeline = os.path.join(AST_ROOT, "ast_ir", "pipeline.py")
    try:
        proc = subprocess.run(
            [
                sys.executable,
                pipeline,
                "--rtl", rtl_src,
                "--timing", timing,
                "--design", design,
                "--version", version,
                "--out", subtree_out,
            ],
            check=False,
        )
        if proc.returncode != 0:
            print(
                f"WARNING: post-evaluate pipeline failed (exit {proc.returncode}); "
                "ANALYZE will rerun pipeline"
            )
    except Exception as exc:
        print(f"WARNING: post-evaluate pipeline error: {exc}")


def run(design: str, version: str) -> int:
    eda = _eda_root()
    if not os.path.isfile(os.path.join(eda, "env_chip.sh")):
        raise FileNotFoundError(
            f"AST EDA workspace missing at {eda}; run scripts/setup_ast_eda_workspace.sh"
        )

    ext = _load_ext(design)
    rtl_src = _ensure_rtl(design, version, ext)
    rtl_dst = os.path.join(eda, "rtl", f"{design}.{version}.{ext}")
    os.makedirs(os.path.dirname(rtl_dst), exist_ok=True)
    shutil.copy2(rtl_src, rtl_dst)

    inner = (
        f"cd {json.dumps(eda)} && source env_chip.sh && "
        f"python3 run_design.py {design} {version}"
    )
    if os.environ.get("CHIP_EVO_EDA_FLOCK"):
        inner = f"flock -w 3600 /tmp/chipevo_eda.lock bash -lc {json.dumps(inner)}"
    print(f"=== AST local evaluate: {design}.{version} (EDA_ROOT={eda}) ===")
    proc = subprocess.run(["bash", "-lc", inner], check=False)
    if proc.returncode != 0:
        return proc.returncode

    out_src = os.path.join(eda, "output", f"{design}.{version}")
    out_dst = os.path.join(SYN_FLOW, "output", f"{design}.{version}")
    if os.path.isdir(out_src):
        shutil.copytree(out_src, out_dst, dirs_exist_ok=True)

    timing = os.path.join(out_dst, "timing_word.json")
    if os.path.isfile(timing):
        _run_post_evaluate_pipeline(design, version, rtl_src, timing)
    return 0


def main() -> None:
    if len(sys.argv) < 3:
        print("Usage: python3 run_evaluate.py <design_name> <design_version>")
        sys.exit(1)
    sys.exit(run(sys.argv[1], sys.argv[2]))


if __name__ == "__main__":
    main()
