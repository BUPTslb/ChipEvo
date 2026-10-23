#!/bin/bash
# Launch AST full20 in tmux session drrtl_ast.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SESSION="drrtl_ast"

if tmux has-session -t "${SESSION}" 2>/dev/null; then
  echo "Session ${SESSION} already exists."
  echo "  Stop:  tmux kill-session -t ${SESSION}"
  echo "  Attach: tmux attach -t ${SESSION}"
  exit 1
fi

bash "${ROOT}/scripts/setup_ast_eda_workspace.sh"

tmux new-session -d -s "${SESSION}" -c "${ROOT}" \
  "bash suite/run_full20.sh; echo '=== AST FULL20 FINISHED ==='; bash"

echo "Started tmux session: ${SESSION}"
echo "  attach: tmux attach -t ${SESSION}"
echo "  log:    tail -f ${ROOT}/ast/build/suite_full20/logs/suite.log"
echo "  log2:   tail -f ${ROOT}/ast/build/suite_full20/logs/run_*.log"
