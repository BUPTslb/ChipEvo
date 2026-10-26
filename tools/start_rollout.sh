#!/usr/bin/env bash
# Default: validate/plan only. Explicit --run enables model calls AND native EDA.
set -euo pipefail
task_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$task_root"
task_python="${CHIPEVO_PYTHON:-$task_root/.venv/bin/python}"
task_config="${1:-configs/studies/example.json}"
task_action="${2:---plan}"
if [[ "$task_action" != --plan && "$task_action" != --run ]]; then
  printf 'Usage: bash tools/start_rollout.sh CONFIG [--plan|--run] [NEW_OUTPUT_DIR]\n' >&2; exit 2
fi
if [[ ! -x "$task_python" ]]; then
  printf 'Install requirements in .venv first, or set CHIPEVO_PYTHON.\n' >&2; exit 2
fi
# Shell config is intentionally not sourced in this launcher. Load ~/.bashrc
# in your interactive parent shell; credentials are inherited, never printed.
"$task_python" -c 'import sys; from chipevo.study_config import read_config; read_config(sys.argv[1],ready=True); print("Configuration valid; no model/EDA work launched")' "$task_config"
if [[ "$task_action" == --plan ]]; then
  exec "$task_python" -m chipevo study-plan --config "$task_config"
fi
task_output="${3:-artifacts/studies/$(date -u +%Y%m%dT%H%M%SZ)-$$}"
if [[ -e "$task_output" ]]; then printf 'Output already exists; choose a new directory.\n' >&2; exit 2; fi
task_need_astra="$("$task_python" -c 'import sys; from chipevo.study_config import read_config; print(int(any(m["api_key_env"]=="ChipEVO_Astra" for m in read_config(sys.argv[1],True)["models"])))' "$task_config")"
if [[ "$task_need_astra" == 1 ]]; then
  if [[ -z "${ChipEVO_Astra:-}" ]]; then
    if [[ ! -r "$HOME/.local/share/astra-api-proxy/client.key" ]]; then printf 'Missing Astra proxy client key file.\n' >&2; exit 2; fi
    export ChipEVO_Astra
    ChipEVO_Astra="$(< "$HOME/.local/share/astra-api-proxy/client.key")"
  fi
fi
"$task_python" -c 'import os,sys; from chipevo.study_config import read_config; c=read_config(sys.argv[1],True); missing=[m["api_key_env"] for m in c["models"] if not os.environ.get(m["api_key_env"])]; print("Missing exported variables: "+", ".join(missing)) if missing else print("Credential presence checked; values omitted"); sys.exit(bool(missing))' "$task_config"
printf 'Starting model AND EDA experiment. Output: %s\n' "$task_output"
exec "$task_python" -m chipevo study-run --config "$task_config" --output "$task_output" --run-model --run-eda
