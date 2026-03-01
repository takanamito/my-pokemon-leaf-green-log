#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environment
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install markdownlint-cli for linting markdown files
if ! command -v markdownlint &> /dev/null; then
  npm install -g markdownlint-cli
fi
