# Anglers Note

[English README](README.md)

釣果・釣行記録アプリ（Flutter）。釣行ごとの記録、釣果（魚種・サイズ等）の記録、タックル（釣具）管理を一つのアプリでまとめて行える。

## 主な機能

- 釣行記録（日時・場所などを記録し、一覧・詳細表示）
- 釣果記録（釣行に紐づく魚種・サイズなどを記録、写真添付）
- タックル管理（使用した釣具の登録・編集）
- ホーム画面に釣行数・釣果数・魚種ランキングを表示
- 位置情報・天気情報の取得（釣行時の環境記録）

## 技術構成

- Flutter / Dart
- 状態管理: Riverpod（`flutter_riverpod` / `riverpod_annotation`）
- ルーティング: `go_router`
- ローカルDB: `drift`（SQLite）
- 位置情報: `geolocator`
- 画像選択: `image_picker`

## ディレクトリ構成

```
lib/src/
  core/        # DB・サービス・共通ウィジェット
  features/
    fishing_log/  # 釣行・釣果記録
    tackle/        # タックル管理
    settings/      # 設定
  routing/     # 画面遷移定義
```

## セットアップ・実行

```bash
flutter pub get
flutter run
```

コード生成（drift/freezed/riverpod_annotationの.gファイル）が必要な場合:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 対応プラットフォーム

iOS / Android / macOS / Web / Linux / Windows（Flutter標準のマルチプラットフォーム構成）
