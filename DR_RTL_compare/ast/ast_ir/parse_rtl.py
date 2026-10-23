#!/usr/bin/env python3
"""Parse Verilog/SystemVerilog via slang → AST JSON + symbol/block index."""
from __future__ import annotations

import argparse
import json
from pathlib import Path

from slang_driver import parse_with_slang, resolve_slang_bin


def parse_rtl(rtl_path: Path, top: str | None = None) -> dict:
    doc = parse_with_slang(rtl_path)
    if top:
        doc["top"] = top
    return doc


def main() -> None:
    ap = argparse.ArgumentParser(description="RTL → slang AST JSON")
    ap.add_argument("--rtl", required=True, type=Path)
    ap.add_argument("--top", default=None)
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument(
        "--compact",
        action="store_true",
        help="Omit full slang_ast blob; keep index only",
    )
    args = ap.parse_args()

    doc = parse_rtl(args.rtl, args.top)
    if args.compact and "slang_ast" in doc:
        doc = {k: v for k, v in doc.items() if k != "slang_ast"}

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(doc, indent=2), encoding="utf-8")
    sym_n = len(doc.get("index", {}).get("symbols", {}))
    blk_n = len(doc.get("index", {}).get("blocks", {}))
    print(f"Wrote slang AST: {args.out} (symbols={sym_n}, blocks={blk_n}, slang={resolve_slang_bin()})")


if __name__ == "__main__":
    main()
