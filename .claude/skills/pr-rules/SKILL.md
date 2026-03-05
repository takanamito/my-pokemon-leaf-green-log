---
description: "PullRequest作成時のルール。PRを作るときに参照する。"
globs: ""
---

## PullRequest作成ルール

### gh コマンドについて

この環境では `gh` コマンドが使えないため、Claude Code による PR 作成は不要。
takanamito が手動で PR を作成するので、Claude Code はコミット・プッシュまでを担当する。

### PR のタイトル・本文のルール

takanamito が PR を作成する際の基準として、以下のルールを守る：

- PR のタイトルは**必ず日本語**で書く
- PR の本文も**必ず日本語**で書く
- Summary（箇条書き）、Test plan なども含め、**すべて日本語**で記述する。英語は一切使わない
