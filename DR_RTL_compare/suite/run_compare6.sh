#!/bin/bash
# Compare6 AST suite — slang pipeline + granularity skill + full agent orchestrator (MiMo CN).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AST="${ROOT}/ast"
cd "${AST}"

source "${ROOT}/.cursor/mimo.env.sh"

: "${SLANG_BIN:?Set SLANG_BIN in .cursor/mimo.env.sh or ~/.bashrc}"
: "${GRANULARITY_SKILL:?Set GRANULARITY_SKILL in .cursor/mimo.env.sh}"

if [[ ! -x "${SLANG_BIN}" && ! -f "${SLANG_BIN}" ]]; then
  echo "ERROR: slang not found at ${SLANG_BIN}" >&2
  echo "Install: bash ast/ast_ir/install_slang.sh" >&2
  exit 1
fi
if [[ ! -f "${GRANULARITY_SKILL}" ]]; then
  echo "ERROR: granularity skill missing: ${GRANULARITY_SKILL}" >&2
  exit 1
fi

LOG_DIR="${AST}/build/suite_ast/logs"
mkdir -p "${LOG_DIR}"
STAMP="$(date +%Y%m%d_%H%M%S)"
LOG_FILE="${LOG_DIR}/run_${STAMP}.log"

echo "============================================"
echo " DR_RTL_compare AST compare6"
echo "============================================"
echo "AST:     ${AST}"
echo "MiMo CN: ${MIMO_URL} model=${MIMO_MODEL}"
echo "Slang:   ${SLANG_BIN}"
echo "Skill:   ${GRANULARITY_SKILL}"
echo "Config:  ${ROOT}/suite/suite_designs.json"
echo "Log:     ${LOG_FILE}"
echo "============================================"

# Avoid Synopsys LD_LIBRARY_PATH breaking python/slang/cmake tools in child processes
export _SAVED_LD_LIBRARY_PATH="${LD_LIBRARY_PATH:-}"
unset LD_LIBRARY_PATH

cd "${AST}"
exec python3 orchestrator.py --config "${ROOT}/suite/suite_designs.json" 2>&1 | tee "${LOG_FILE}"
