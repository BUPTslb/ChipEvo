#!/usr/bin/env python3
"""Invoke slang and build a compact AST index for the ast_ir pipeline."""
from __future__ import annotations

import json
import os
import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any

DEFAULT_SLANG = Path.home() / "tools" / "slang" / "slang"
PROJECT_SLANG = Path(__file__).resolve().parents[2] / "tools" / "slang" / "slang"


def resolve_slang_bin() -> Path:
    for candidate in (
        os.environ.get("SLANG_BIN"),
        str(DEFAULT_SLANG),
        str(PROJECT_SLANG),
    ):
        if candidate and Path(candidate).is_file():
            return Path(candidate)
    found = shutil.which("slang")
    if found:
        return Path(found)
    raise FileNotFoundError(
        "slang binary not found. Install to ~/tools/slang/slang or set SLANG_BIN."
    )


def _slang_version(bin_path: Path) -> str:
    proc = subprocess.run(
        [str(bin_path), "--version"],
        check=False,
        capture_output=True,
        text=True,
    )
    line = (proc.stdout or proc.stderr or "").strip().splitlines()
    return line[0] if line else "unknown"


def run_slang_ast(rtl_path: Path, slang_bin: Path | None = None) -> dict[str, Any]:
    bin_path = slang_bin or resolve_slang_bin()
    with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as tmp:
        out = Path(tmp.name)
    try:
        proc = subprocess.run(
            [
                str(bin_path),
                str(rtl_path.resolve()),
                "--ast-json",
                str(out),
                "--ast-json-source-info",
            ],
            check=False,
            capture_output=True,
            text=True,
        )
        if proc.returncode != 0:
            raise RuntimeError(
                f"slang failed (exit {proc.returncode}):\n{proc.stdout}\n{proc.stderr}"
            )
        return json.loads(out.read_text(encoding="utf-8"))
    finally:
        out.unlink(missing_ok=True)


def _walk_ast(node: Any, symbols: dict[str, dict], blocks: list[dict]) -> None:
    if isinstance(node, dict):
        kind = node.get("kind")
        if kind in ("Variable", "Net", "Port"):
            name = node.get("name")
            if name and name not in symbols:
                symbols[name] = {
                    "kind": kind,
                    "line": node.get("source_line"),
                    "column": node.get("source_column"),
                    "type": node.get("type"),
                }
        if kind in ("ProceduralBlock", "ContinuousAssign"):
            blocks.append(
                {
                    "id": f"blk_{node.get('source_line', 0):05d}",
                    "kind": kind,
                    "procedure_kind": node.get("procedureKind"),
                    "start_line": node.get("source_line"),
                    "addr": node.get("addr"),
                }
            )
        for value in node.values():
            _walk_ast(value, symbols, blocks)
    elif isinstance(node, list):
        for item in node:
            _walk_ast(item, symbols, blocks)


def _finalize_blocks(blocks: list[dict], line_count: int) -> list[dict]:
    blocks = [b for b in blocks if b.get("start_line")]
    blocks.sort(key=lambda b: b["start_line"])
    for i, block in enumerate(blocks):
        if i + 1 < len(blocks):
            block["end_line"] = blocks[i + 1]["start_line"] - 1
        else:
            block["end_line"] = line_count
    return blocks


def _infer_top(raw: dict[str, Any]) -> str | None:
    design = raw.get("design") or {}
    for member in design.get("members") or []:
        if member.get("kind") == "Instance" and member.get("name"):
            return member["name"]
    for definition in raw.get("definitions") or []:
        if definition.get("definitionKind") == "module":
            return definition.get("name")
    return None


def build_index(raw: dict[str, Any], rtl_path: Path) -> dict[str, Any]:
    text = rtl_path.read_text(encoding="utf-8", errors="replace")
    line_count = len(text.splitlines())
    symbols: dict[str, dict] = {}
    blocks: list[dict] = []
    _walk_ast(raw, symbols, blocks)
    blocks = _finalize_blocks(blocks, line_count)
    return {
        "source": str(rtl_path.resolve()),
        "line_count": line_count,
        "top": _infer_top(raw),
        "symbols": symbols,
        "blocks": blocks,
    }


def blocks_containing_signal(
    blocks: list[dict], rtl_lines: list[str], signal: str
) -> list[dict]:
    pat = re.compile(rf"\b{re.escape(signal)}\b")
    hits: list[dict] = []
    for block in blocks:
        start = block["start_line"] - 1
        end = block["end_line"]
        chunk = "\n".join(rtl_lines[start:end])
        if pat.search(chunk):
            hits.append(block)
    return hits


def parse_with_slang(rtl_path: Path, slang_bin: Path | None = None) -> dict[str, Any]:
    bin_path = slang_bin or resolve_slang_bin()
    raw = run_slang_ast(rtl_path, bin_path)
    index = build_index(raw, rtl_path)
    return {
        "source": index["source"],
        "top": index["top"],
        "line_count": index["line_count"],
        "parser": {"name": "slang", "version": _slang_version(bin_path)},
        "status": "ok",
        "index": index,
        "slang_ast": raw,
    }
