#!/bin/bash
set -euo pipefail

# Edit/Write後に .md ファイルのみ markdownlint を実行する
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# .md ファイル以外はスキップ
if [[ "$FILE_PATH" != *.md ]]; then
  exit 0
fi

# markdownlint が利用可能な場合のみ実行
if command -v markdownlint &> /dev/null; then
  markdownlint "$FILE_PATH" --fix 2>&1 || true
fi

exit 0
