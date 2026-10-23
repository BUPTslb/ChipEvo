#!/bin/bash
# Isolated EDA workspace for AST track — parallel-safe vs DR_RTL/syn_flow_eda.
set -euo pipefail

COMPARE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CANON_EDA="$(cd "${COMPARE_ROOT}/../DR_RTL/syn_flow_eda" && pwd)"
WS="${COMPARE_ROOT}/ast/build/eda_workspace"

if [[ ! -f "${CANON_EDA}/env_chip.sh" ]]; then
  echo "ERROR: canonical EDA not found: ${CANON_EDA}" >&2
  exit 1
fi

mkdir -p "${WS}"/{rtl,log,output,reports,netlist,work,jgproject}

# Remove stale artifacts from prior runs (e.g. compare6) so DC failures cannot reuse old reports.
if [[ "${CHIP_EVO_EDA_CLEAN:-1}" == "1" ]]; then
  rm -rf "${WS}"/{log,output,reports,netlist,work,jgproject}/*
fi

link_or_refresh() {
  local src="$1" dst="$2"
  ln -sfn "${src}" "${dst}"
}

for name in run_design.py env_chip.sh design_all.json; do
  link_or_refresh "${CANON_EDA}/${name}" "${WS}/${name}"
done
for name in scr lib tb; do
  if [[ -e "${CANON_EDA}/${name}" ]]; then
    link_or_refresh "${CANON_EDA}/${name}" "${WS}/${name}"
  fi
done

echo "AST EDA workspace ready: ${WS}"
echo "  canonical (read-only): ${CANON_EDA}"
