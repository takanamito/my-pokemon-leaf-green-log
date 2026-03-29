#!/bin/bash
set -euo pipefail

# 既存レポートの画像や重要ファイルの誤上書きを防止する
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# 保護対象パターン
# 1. 既存レポートの画像ディレクトリ内ファイル（images/NNN_*/）への上書き
# 2. .env やシークレット系ファイル
PROTECTED_PATTERNS=(
  ".env"
  ".git/"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "ブロック: $FILE_PATH は保護対象パターン '$pattern' に一致するため編集できません" >&2
    exit 2
  fi
done

# images/ 配下のサブディレクトリ内の既存ファイルへの上書きを防止
# (images/ 直下は OK、images/NNN_xxx/ 内の既存ファイルはブロック)
if [[ "$FILE_PATH" =~ images/[0-9]{3}_[^/]+/.+ ]]; then
  if [ -f "$FILE_PATH" ]; then
    echo "ブロック: $FILE_PATH は既存のレポート画像です。上書きは許可されていません" >&2
    exit 2
  fi
fi

exit 0
