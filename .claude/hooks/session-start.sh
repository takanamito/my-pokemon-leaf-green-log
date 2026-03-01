#!/bin/bash
set -euo pipefail

# Install markdownlint-cli for linting markdown files
if ! command -v markdownlint &> /dev/null; then
  npm install -g markdownlint-cli
fi
