#!/usr/bin/env python3
"""Map timing_word.json paths onto slang AST symbols and syntax blocks."""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

from slang_driver import blocks_containing_signal


def _signals_from_path(path_key: str) -> list[str]:
    parts = path_key.split("->")
    tokens: list[str] = []
    for part in parts:
        tok = part.strip().split()[0]
        tok = re.sub(r"\[.*\]$", "", tok)
        tok = re.sub(r"_reg$", "", tok)
        if tok and tok not in tokens:
            tokens.append(tok)
    return tokens


def annotate(ast: dict, timing: dict) -> dict:
    index = ast.get("index") or {}
    symbols = index.get("symbols") or {}
    blocks = index.get("blocks") or []
    rtl_path = Path(ast.get("source") or index.get("source") or "")
    rtl_lines = (
        rtl_path.read_text(encoding="utf-8", errors="replace").splitlines()
        if rtl_path.is_file()
        else []
    )

    path_entries = []
    for path_key, slack in timing.items():
        signals = _signals_from_path(path_key)
        signal_nodes = []
        related_blocks: dict[str, dict] = {}
        for sig in signals:
            sym = symbols.get(sig)
            if sym:
                signal_nodes.append({"signal": sig, **sym})
            for block in blocks_containing_signal(blocks, rtl_lines, sig):
                related_blocks[block["id"]] = block

        path_entries.append(
            {
                "path": path_key,
                "slack": slack,
                "signals": signals,
                "symbol_nodes": signal_nodes,
                "blocks": list(related_blocks.values()),
            }
        )

    path_entries.sort(key=lambda x: x["slack"])
    return {
        "ast_ref": ast.get("source"),
        "parser": ast.get("parser"),
        "top": ast.get("top") or index.get("top"),
        "annotated_paths": path_entries,
        "status": "ok" if ast.get("status") == "ok" else ast.get("status", "unknown"),
    }


def main() -> None:
    ap = argparse.ArgumentParser(description="Annotate AST with timing paths")
    ap.add_argument("--ast", required=True, type=Path)
    ap.add_argument("--timing", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()

    ast = json.loads(args.ast.read_text(encoding="utf-8"))
    timing = json.loads(args.timing.read_text(encoding="utf-8"))
    result = annotate(ast, timing)

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, indent=2), encoding="utf-8")
    print(f"Wrote annotations: {args.out} ({len(result['annotated_paths'])} paths)")


if __name__ == "__main__":
    main()
