# Swift Claude Code コンテナ環境

## Build

```shell
docker build -t swift-claude-code:latest -f ./Dockerfile .
```

## Docker

```shell
docker run --rm -it \
  -v "${HOME}/.claude":/swiftlover/.claude \
  -v "${HOME}/.gitconfig":/swiftlover/.gitconfig \
  -v "$(pwd)":/swiftlover/workspace \
  -w /swiftlover/workspace \
  lemonaderoom/swift-claude-code:latest bash
```

## Containerization Framework

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

## 危険な完全自動モード

```shell
claude --dangerously-skip-permissions
```