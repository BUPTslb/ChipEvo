#!/bin/bash
set -uo pipefail
CHIPS=/home/shen/Desktop/project/ChipEvo/chips
SOURCE="$CHIPS/tools/OpenRAM-b2b069ce119d1488cbe6883b2240bceb5c7ce29a"
IMAGE=$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))[0])' "$CHIPS/technology/sram/docker-digests.json")
for kind in probe_1rw probe_1r1w; do
  printf running > "$CHIPS/gemmini/build/openram/$kind.exitcode"
  timeout 600 docker run --name "chipevo-$kind" --rm --network none --cpus 4 --memory 8g --user "$(id -u):$(id -g)" \
    -e OMP_NUM_THREADS=1 -e PYTHONUNBUFFERED=1 -e HOME=/tmp -e PYTHONPYCACHEPREFIX=/tmp/pycache -e OPENRAM_HOME=/openram/compiler -e OPENRAM_TECH=/openram/technology \
    -v "$SOURCE:/openram:ro" \
    -v "$CHIPS/technology/sram/configs:/configs:ro" \
    -v "$CHIPS/gemmini/build/openram:/out" \
    "$IMAGE" bash -c 'source /openram/docker/set-paths.sh; python3 /openram/sram_compiler.py "$1"' -- "/configs/$kind.py" \
    > "$CHIPS/gemmini/build/openram/$kind.console.log" 2>&1
  rc=$?
  if [ "$rc" = 124 ]; then docker stop -t 2 "chipevo-$kind"; fi
  printf '%s\n' "$rc" > "$CHIPS/gemmini/build/openram/$kind.exitcode"
done
