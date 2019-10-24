#!/bin/sh
set -eu

DATA_DIR="$HOME"/.cache/net-cache

mkdir -p "$DATA_DIR"

docker run \
  --rm \
  --name net-cache \
  --net host \
  --init \
  --volume "$PWD"/mitm.pem:/etc/squid/mitm.pem:ro \
  --volume "$DATA_DIR":/var/cache/squid \
  local/net-cache

# Show logs if running in an interactive terminal
if tty -s; then
  docker logs -f net-cache
fi
