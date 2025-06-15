```shell
docker build -t swift-claude-code:latest -f ./Dockerfile .
```

```shell
docker run --rm -it \
  -v "${HOME}/.claude":/swiftlover/.claude \
  -v "${HOME}/.gitconfig":/swiftlover/.gitconfig \
  -v "$(pwd)":/swiftlover/workspace \
  -w /swiftlover/workspace \
  swift-claude-code:latest bash
```

```shell
container system start
container image pull lemonaderoom/swift-claude-code
container run --rm -i -t \
--volume "${HOME}/.claude":/swiftlover/.claude \
--volume "$(pwd)":/swiftlover/workspace \
--cpus 8 \
--memory 16g \
lemonaderoom/swift-claude-code bash
```