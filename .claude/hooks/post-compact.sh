#!/bin/bash
set -euo pipefail

# compact後にパーティ情報と進行状況を再注入する
echo "【compact後リマインダー】"
echo "- タイプ相性は必ず battle/SKILL.md の相性表で確認すること（記憶で判断しない）"
echo "- パーティの状態は takanamito の最新報告を基準にする"
echo "- 技を推奨する前に memory-check スキルの手順を踏むこと"
echo ""

# 直近のコミットから進行状況を推測
cd "$CLAUDE_PROJECT_DIR"
echo "【直近の攻略ログ】"
git log --oneline -3 2>/dev/null || echo "(git log 取得失敗)"
