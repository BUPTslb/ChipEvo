#!/bin/bash
# Start baseline (path) + AST full20 in parallel tmux sessions.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
CHIP_EVO="$(cd "${ROOT}/.." && pwd)"
BASELINE="${CHIP_EVO}/DR_RTL"
AST_SESSION="${DR_RTL_AST_TMUX_SESSION:-drrtl_ast}"
PATH_SESSION="${DR_RTL_TMUX_SESSION:-drrtl_path_full20}"

echo "=== Parallel full20 ==="
echo "  Baseline EDA: ${BASELINE}/syn_flow_eda"
echo "  AST EDA:      ${ROOT}/ast/build/eda_workspace"
echo "  Baseline tmux: ${PATH_SESSION}"
echo "  AST tmux:      ${AST_SESSION}"
echo ""

# Serialize DC when a single license seat is shared between tracks.
export CHIP_EVO_EDA_FLOCK="${CHIP_EVO_EDA_FLOCK:-1}"

bash "${ROOT}/scripts/setup_ast_eda_workspace.sh"

# Clean baseline EDA mutable dirs for a fresh full20 run.
BASELINE_EDA="${BASELINE}/syn_flow_eda"
mkdir -p "${BASELINE_EDA}"/{rtl,log,output,reports,netlist,work,jgproject}
rm -rf "${BASELINE_EDA}"/{log,output,reports,netlist,work,jgproject}/*

if tmux has-session -t "${PATH_SESSION}" 2>/dev/null; then
  echo "WARN: ${PATH_SESSION} already exists (skip baseline start)"
else
  DR_RTL_TMUX_SESSION="${PATH_SESSION}" bash "${BASELINE}/start_tmux.sh" full20
fi

if tmux has-session -t "${AST_SESSION}" 2>/dev/null; then
  echo "WARN: ${AST_SESSION} already exists (skip AST start)"
else
  bash "${ROOT}/start_tmux.sh"
fi

echo ""
echo "Monitor:"
echo "  tmux ls"
echo "  tmux attach -t ${PATH_SESSION}"
echo "  tmux attach -t ${AST_SESSION}"
echo "  tail -f ${BASELINE}/build/suite_full20_*.log"
echo "  tail -f ${ROOT}/ast/build/suite_full20/logs/run_*.log"
echo ""
echo "Progress:"
echo "  ls ${BASELINE}/syn_flow/history/*.history.json | wc -l"
echo "  ls ${ROOT}/ast/syn_flow/history/*.history.json | wc -l"
