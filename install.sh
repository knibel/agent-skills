#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
TARGET="${BIN_DIR}/myskills"
BASHRC="${HOME}/.bashrc"
PATH_LINE='export PATH="$HOME/.local/bin:$PATH"'

mkdir -p "${BIN_DIR}"
ln -sfn "${REPO_DIR}/bin/myskills" "${TARGET}"
chmod +x "${REPO_DIR}/bin/myskills"

if [ ! -f "${BASHRC}" ] || ! grep -Fqx "${PATH_LINE}" "${BASHRC}"; then
  printf '\n# Added by agent-skills\n%s\n' "${PATH_LINE}" >> "${BASHRC}"
fi

"${TARGET}" update

echo "Installed myskills to ${TARGET}"
