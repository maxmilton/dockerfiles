#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker run \
  --rm \
  --name net-tools \
  --network host \
  local/net-tools "$@"
  # OR
  # maxmilton/net-tools "$@"
