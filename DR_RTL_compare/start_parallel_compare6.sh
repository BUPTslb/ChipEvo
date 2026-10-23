#!/bin/bash
# Start baseline + AST compare6 in parallel (separate EDA workspaces).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "=== Parallel compare6 ==="
echo "  Baseline EDA: DR_RTL/syn_flow_eda"
echo "  AST EDA:      ast/build/eda_workspace (isolated jgproject/log/rtl)"
echo ""

bash "${ROOT}/scripts/setup_ast_eda_workspace.sh"

if tmux has-session -t drrtl_path_compare6 2>/dev/null; then
  echo "WARN: drrtl_path_compare6 already exists (skip start)"
else
  DR_RTL_TMUX_SESSION=drrtl_path_compare6 bash "${ROOT}/../DR_RTL/start_tmux.sh" pilot
fi

if tmux has-session -t drrtl_ast 2>/dev/null; then
  echo "WARN: drrtl_ast already exists (skip start)"
else
  bash "${ROOT}/start_tmux.sh"
fi

echo ""
echo "Monitor:"
echo "  tail -f ${ROOT}/../DR_RTL/build/suite_baseline/logs/suite.log"
echo "  tail -f ${ROOT}/ast/build/suite_ast/logs/suite.log"
echo "  tmux ls"
