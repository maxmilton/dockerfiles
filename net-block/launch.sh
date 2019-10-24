#!/bin/sh
set -eu

docker run \
  --rm \
  --name net-block \
  --init \
  --volume "$PWD"/dnsmasq.d/:/etc/dnsmasq.d/:ro \
  --publish 5553:53/udp \
  local/net-block

# Show logs if running in an interactive terminal
if tty -s; then
  docker logs -f net-block
fi
