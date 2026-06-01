#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
TARGET="${BIN_DIR}/myskills"
BASHRC="${HOME}/.bashrc"
PATH_LINE='export PATH="$HOME/.local/bin:$PATH"'
CURRENT_SHELL=""

if [ -n "${SHELL:-}" ]; then
  CURRENT_SHELL="$(basename "${SHELL}")"
fi

mkdir -p "${BIN_DIR}"
ln -sfn "${REPO_DIR}/bin/myskills" "${TARGET}"
chmod +x "${REPO_DIR}/bin/myskills"

if [ -f "${BASHRC}" ]; then
  if ! grep -Fqx "${PATH_LINE}" "${BASHRC}"; then
    printf '\n# Added by agent-skills\n%s\n' "${PATH_LINE}" >> "${BASHRC}"
  fi
elif [ "${CURRENT_SHELL}" = "bash" ]; then
  printf '# Added by agent-skills\n%s\n' "${PATH_LINE}" > "${BASHRC}"
else
  echo "Skipping ~/.bashrc update because the current shell is not bash. Add ~/.local/bin to your shell PATH manually if needed."
fi

"${TARGET}" update

echo "Installed myskills to ${TARGET}"
