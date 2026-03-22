---
name: report-readme
description: "レポート作成時にREADME.mdのレポート一覧テーブルを更新する。"
tools: Read, Edit
model: haiku
maxTurns: 5
---

README.md のレポート一覧テーブルに新しいレポートの行を追加するエージェント。

## 入力

呼び出し時に以下の情報が渡される：
- レポート番号（NNN）
- エリア名（日本語）
- レポートファイルパス（例: `reports/010_route9_rock_tunnel.md`）

## 手順

1. `README.md` を Read で読み込む
2. `## 攻略レポート一覧` のテーブルに新しい行を追加する
3. 既存の行のフォーマットに合わせる

## 出力フォーマット

```
README.md 更新完了
追加行: | NNN | エリア名 | [reports/NNN_xxx.md](reports/NNN_xxx.md) |
```
