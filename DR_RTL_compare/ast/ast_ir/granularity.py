#!/usr/bin/env python3
"""Subtree granularity helpers — adapted from rtl-subtree-granularity skill."""
from __future__ import annotations

import re

# Level constants (see ast/.claude/skill/rtl-subtree-granularity/skill.md)
L_MODULE = 1
L_PROCESS = 2
L_SEMANTIC = 3
L_STATEMENT = 4
L_ASSIGNMENT = 5
L_EXPRESSION = 6
L_OPERATOR = 7

FROZEN_SEMANTIC_TAGS = frozenset(
    {"protected_region", "reset", "memory_interface", "clock_reset", "cdc"}
)

RESET_CLK_RE = re.compile(r"(^clk$|^clock$|^rst|^reset|_rst$|_reset$)", re.I)
STATE_RE = re.compile(r"(^state$|state_|_state|fsm|curr_state|next_state)", re.I)
ADDR_RE = re.compile(r"(^addr$|_addr$|address|offset|index|ptr|pointer|pc$)", re.I)
DATAPATH_RE = re.compile(r"(alu|mul|add|acc|data|wdata|rdata|result|out)", re.I)


def infer_semantic_tag(signals: list[str], procedure_kind: str | None = None) -> str:
    lowered = [s.lower() for s in signals]
    if any(RESET_CLK_RE.search(s) for s in lowered):
        return "clock_reset"
    if any(STATE_RE.search(s) for s in lowered):
        return "state_update"
    if any(ADDR_RE.search(s) for s in lowered):
        return "address_generation"
    if any(DATAPATH_RE.search(s) for s in lowered):
        return "datapath_update"
    if procedure_kind == "Always":
        return "sequential_update"
    return "combinational_update"


def risk_level(level: int, write_set: list[str], semantic_tag: str) -> int:
    """1=low … 5=very high."""
    if semantic_tag in FROZEN_SEMANTIC_TAGS:
        return 5
    if level >= L_EXPRESSION:
        return 1
    if level == L_ASSIGNMENT:
        return 2
    if level == L_STATEMENT:
        return 3
    if level == L_PROCESS:
        n = len(write_set)
        if n <= 1:
            return 3
        if n <= 3:
            return 4
        return 5
    return 4


def is_mutable(level: int, semantic_tag: str, write_set: list[str]) -> bool:
    if semantic_tag in FROZEN_SEMANTIC_TAGS:
        return False
    if any(RESET_CLK_RE.search(s) for s in write_set):
        return False
    # L2 process blocks are ranking containers until CST splitter emits L5.
    if level <= L_PROCESS:
        return False
    if level <= L_STATEMENT and len(write_set) > 2:
        return False
    return True


def process_container_kind(block: dict) -> str:
    kind = block.get("kind", "")
    if kind == "ProceduralBlock":
        return "process_container"
    if kind == "ContinuousAssign":
        return "continuous_assign_container"
    return "signal_cluster"


def mutation_guidance(level: int, mutable: bool) -> str:
    if level <= L_PROCESS and not mutable:
        return (
            "Container only (L2). Decompose span into L5 assignment-slices "
            "(one target register/output + guards) before applying rtl-opt transforms."
        )
    if level == L_ASSIGNMENT:
        return "Primary mutation unit (L5). Apply one rtl-opt strategy; preserve write_set."
    if level >= L_EXPRESSION:
        return "Expression-level (L6). Safe local equivalence rewrites only."
    return "Refine to L5–L6 before mutating."


def pattern_focus_levels(pattern_focus: str | None) -> list[int]:
    if pattern_focus == "combinational":
        return [L_EXPRESSION, L_ASSIGNMENT]
    if pattern_focus == "sequential":
        return [L_ASSIGNMENT, L_SEMANTIC]
    if pattern_focus == "mixed":
        return [L_ASSIGNMENT, L_EXPRESSION, L_SEMANTIC]
    return [L_ASSIGNMENT, L_EXPRESSION]
