#!/bin/bash
set -euo pipefail

# Stop hook: バトル終了時に【次のバトル準備】フォーマットがあるか検証する
# stdin から hook の JSON データを受け取る

INPUT=$(cat)

# last_assistant_message を抽出
LAST_MSG=$(echo "$INPUT" | jq -r '.last_assistant_message // ""')

# バトル終了を示すキーワードがあるか確認
# 「倒した」「撃破」「勝った」「勝利」「を倒し」などのバトル完了表現を検出
if echo "$LAST_MSG" | grep -qE '(倒した|撃破|勝った|勝利|を倒し|との戦い|バトルに勝|戦闘終了|を やっつけた)'; then
  # バトルが終了している場合、【次のバトル準備】があるか確認
  if echo "$LAST_MSG" | grep -q '【次のバトル準備】'; then
    echo '{"ok":true}'
  else
    echo '{"ok":false,"reason":"バトルが終了しましたが【次のバトル準備】フォーマットが含まれていません。先頭ポケモンと技構成を出力してください。"}'
  fi
else
  # バトルが終了していない場合はOK
  echo '{"ok":true}'
fi
