#!/bin/sh
set -eu

DATA_DIR="$HOME"/.cache/net-cache

# build image if it does not already exist
if test -z "$(docker images -q local/net-cache)"; then
  docker build -t local/net-cache .
fi

mkdir -p "$DATA_DIR"

# TODO: Use systemd to manage this container rather than docker --restart
  # --restart unless-stopped \
docker run -t \
  --rm \
  --name net-cache \
  --net host \
  -v "$PWD"/mitm.pem:/etc/squid/mitm.pem \
  -v "$DATA_DIR":/var/cache/squid \
  local/net-cache

# show logs if running in an interactive terminal
if tty -s; then
  docker logs -f net-cache
fi
