# Swift Claude Code コンテナ環境

Swift開発環境とClaude Code AIアシスタントを統合した完全なDockerコンテナ環境です。

## 機能

- **Swift開発**: Swiftlyによる最新のSwiftツールチェーン
- **AI支援コーディング**: Claude Code CLIがプリインストール済み
- **Web開発**: Swift用WebフレームワークのVaporを同梱
- **開発ツール**: Git、Node.js、AWS SAM CLI、Swift Format、OpenTofuなど
- **パッケージ管理**: Homebrewによる簡単なパッケージインストール
- **Docker-in-Docker**: コンテナ内でのDocker実行サポート
- **非rootユーザー**: `swiftlover`ユーザーによる安全な開発環境

## クイックスタート

### Docker Hubイメージの使用

```shell
docker run --rm -it \
  -v "${HOME}/.claude":/swiftlover/.claude \
  -v "${HOME}/.gitconfig":/swiftlover/.gitconfig \
  -v "$(pwd)":/swiftlover/workspace \
  -w /swiftlover/workspace \
  lemonaderoom/swift-claude-code:latest bash
```

### ソースからのビルド

```shell
docker build -t swift-claude-code:latest -f ./Dockerfile .
```

## 使用例

### 基本的な使用方法

```shell
# イメージをプル
docker pull lemonaderoom/swift-claude-code:latest

# コンテナを実行
docker run --rm -it \
  -v "${HOME}/.claude":/swiftlover/.claude \
  -v "$(pwd)":/swiftlover/workspace \
  lemonaderoom/swift-claude-code:latest bash
```

### リソース制限付きの実行

```shell
docker run --rm -it \
  -v "${HOME}/.claude":/swiftlover/.claude \
  -v "$(pwd)":/swiftlover/workspace \
  --cpus 8 \
  --memory 24g \
  lemonaderoom/swift-claude-code:latest bash
```

### コンテナフレームワークの使用

```shell
container system start
container image pull lemonaderoom/swift-claude-code
container run --rm -i -t \
  --volume "${HOME}/.claude":/swiftlover/.claude \
  --volume "$(pwd)":/swiftlover/workspace \
  --cpus 8 \
  --memory 24g \
  lemonaderoom/swift-claude-code bash
```

## Claude Codeの使用方法

コンテナ内でClaude Codeを使用できます：

```shell
# インタラクティブモード
claude

# 自動モード（注意して使用してください）
claude --dangerously-skip-permissions
```

## 含まれるソフトウェア

- **ベースOS**: Ubuntu Noble
- **Swift**: Swiftly経由の最新安定版
- **Vapor**: Swift Webフレームワーク
- **Claude Code**: AIコーディングアシスタント
- **Git**: バージョン管理
- **Node.js**: JavaScriptランタイム
- **Homebrew**: パッケージマネージャー
- **AWS SAM CLI**: サーバーレスアプリケーション開発
- **Swift Protobuf**: Swift用プロトコルバッファ
- **Swift Format**: コードフォーマッター
- **Docker**: コンテナランタイム
- **OpenTofu**: Terraform互換のインフラストラクチャ管理ツール

## ボリュームマウント

- `~/.claude`: Claude設定と認証情報
- `~/.gitconfig`: Git設定（オプション）
- `$(pwd)`: プロジェクトディレクトリを`/swiftlover/workspace`にマウント

## 必要要件

- システムにDockerがインストールされていること
- Claude Code APIキー（AI機能を使用する場合）

## ライセンス

このプロジェクトはMITライセンスの下でライセンスされています。詳細は[LICENSE](LICENSE)ファイルをご覧ください。

## 作者

Yoichiro Tanaka

## コントリビューション

コントリビューションを歓迎します！お気軽にPull Requestを送ってください。