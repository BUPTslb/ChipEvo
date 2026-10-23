#!/usr/bin/env python3
"""Re-export DR_RTL baseline agent runtime (AST track shares scoring/EDA helpers)."""
from __future__ import annotations

import sys
from pathlib import Path

_DR_RTL_SYN = Path(__file__).resolve().parents[2] / "DR_RTL" / "syn_flow"
if str(_DR_RTL_SYN) not in sys.path:
    sys.path.insert(0, str(_DR_RTL_SYN))

from agent_runtime import *  # noqa: F401,F403,E402
