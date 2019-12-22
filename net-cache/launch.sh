#!/bin/sh
set -eu

DATA_DIR="$HOME"/.cache/net-cache

mkdir -p "$DATA_DIR"

docker run \
  --rm \
  --name net-cache \
  --init \
  --volume "$PWD"/mitm.pem:/etc/squid/mitm.pem:ro \
  --volume "$DATA_DIR":/var/cache/squid \
  --publish 3128:3128 \
  local/net-cache
