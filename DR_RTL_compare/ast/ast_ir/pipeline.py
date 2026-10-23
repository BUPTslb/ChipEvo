#!/usr/bin/env python3
"""End-to-end AST IR pipeline: RTL + timing → ranked subtrees JSON."""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

_IR_DIR = Path(__file__).resolve().parent
_AST_ROOT = _IR_DIR.parent
_ARTIFACTS = _AST_ROOT / "artifacts"
if str(_IR_DIR) not in sys.path:
    sys.path.insert(0, str(_IR_DIR))

from annotate_timing import annotate  # noqa: E402
from parse_rtl import parse_rtl  # noqa: E402
from rank_subtrees import DEFAULT_WEIGHTS, rank_subtrees  # noqa: E402


def run(
    rtl: Path,
    timing: Path,
    design: str,
    version: str,
    top_k: int,
    out: Path,
    rank_offset: int = 0,
) -> None:
    ast = parse_rtl(rtl)
    annotated = annotate(ast, json.loads(timing.read_text()))
    ranked = rank_subtrees(annotated, top_k, DEFAULT_WEIGHTS, rank_offset)
    ranked["design"] = design
    ranked["version"] = version

    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(ranked, indent=2))

    ast_dir = _ARTIFACTS / "ast"
    ast_dir.mkdir(parents=True, exist_ok=True)
    (ast_dir / f"{design}.{version}.json").write_text(json.dumps(ast, indent=2))


def main() -> None:
    ap = argparse.ArgumentParser(description="AST IR pipeline")
    ap.add_argument("--rtl", required=True, type=Path)
    ap.add_argument("--timing", required=True, type=Path)
    ap.add_argument("--design", required=True)
    ap.add_argument("--version", required=True)
    ap.add_argument("--top-k", type=int, default=10)
    ap.add_argument("--rank-offset", type=int, default=0)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()
    run(
        args.rtl,
        args.timing,
        args.design,
        args.version,
        args.top_k,
        args.out,
        args.rank_offset,
    )


if __name__ == "__main__":
    main()
