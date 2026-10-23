#!/bin/bash
# Shared EDA environment — AST uses isolated workspace when CHIP_EVO_EDA_ROOT is set.
COMPARE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CANON_EDA="${COMPARE_ROOT}/../DR_RTL/syn_flow_eda"

if [[ ! -f "${CANON_EDA}/env_chip.sh" ]]; then
  echo "ERROR: DR_RTL syn_flow_eda not found at ${CANON_EDA}" >&2
  return 1 2>/dev/null || exit 1
fi

source "${CANON_EDA}/env_chip.sh"
export DR_RTL_COMPARE_ROOT="${COMPARE_ROOT}"
export DR_RTL_EDA_CANON="${CANON_EDA}"
export DR_RTL_EDA_ROOT="${CHIP_EVO_EDA_ROOT:-${COMPARE_ROOT}/ast/build/eda_workspace}"
