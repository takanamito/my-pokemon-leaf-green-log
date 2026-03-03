#!/bin/bash
# Continuity Camera (iPhone) + ffmpeg でゲーム画面を1フレームキャプチャする
# デバイスインデックスは環境に合わせて変更すること
# 確認コマンド: ffmpeg -f avfoundation -list_devices true -i ""

# ---- 設定 ----
VIDEO_DEVICE_INDEX="0"
OUTPUT_DIR="$(cd "$(dirname "$0")/.." && pwd)/images/captures"
OUTPUT_FILE="${OUTPUT_DIR}/screen.jpg"

# ---- 出力先ディレクトリ作成 ----
mkdir -p "${OUTPUT_DIR}"

# ---- キャプチャ実行 ----
ffmpeg -y \
  -f avfoundation \
  -framerate 30 \
  -i "${VIDEO_DEVICE_INDEX}:none" \
  -frames:v 1 \
  -q:v 2 \
  "${OUTPUT_FILE}" \
  2>/dev/null

if [ $? -eq 0 ]; then
  echo "キャプチャ完了: ${OUTPUT_FILE}"
else
  echo "エラー: キャプチャに失敗した。デバイスインデックス (${VIDEO_DEVICE_INDEX}) を確認してください" >&2
  exit 1
fi
