#!/bin/bash
# Full20 AST track — same 20 designs as DR_RTL paper orchestrator.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AST="${ROOT}/ast"
LOG_DIR="${AST}/build/suite_full20/logs"
mkdir -p "${LOG_DIR}"
export CHIP_EVO_EDA_FLOCK="${CHIP_EVO_EDA_FLOCK:-1}"
source "${ROOT}/.cursor/mimo.env.sh"
bash "${ROOT}/scripts/setup_ast_eda_workspace.sh"
LOG_FILE="${LOG_DIR}/run_$(date +%Y%m%d_%H%M%S).log"
cd "${AST}"
exec python3 orchestrator.py --suite full20 "$@" 2>&1 | tee "${LOG_FILE}"
