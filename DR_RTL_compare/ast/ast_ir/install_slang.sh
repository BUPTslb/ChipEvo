#!/bin/bash
# Install slang release binary to ~/tools/slang (no root required).
set -euo pipefail

VERSION="${SLANG_VERSION:-v11.0}"
DEST="${SLANG_INSTALL_DIR:-$HOME/tools/slang}"
URL="https://github.com/MikePopoloski/slang/releases/download/${VERSION}/slang-linux-x86_64.tar.gz"

mkdir -p "${DEST}"
tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT

echo "Downloading slang ${VERSION}..."
curl -fsSL -o "${tmpdir}/slang.tar.gz" "${URL}"
tar -xzf "${tmpdir}/slang.tar.gz" -C "${DEST}"

if [[ ! -x "${DEST}/slang" ]]; then
  echo "ERROR: expected ${DEST}/slang after extract" >&2
  exit 1
fi

echo "Installed: ${DEST}/slang"
"${DEST}/slang" --version
echo
echo "Add to ~/.bashrc:"
echo "  export SLANG_BIN=${DEST}/slang"
echo "  export PATH=${DEST}:\$PATH"
