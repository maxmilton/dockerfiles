#!/bin/bash

# revoke X11 forwarding permission on exit
set -eo errtrace
trap 'xhost -local:$USER' EXIT

# directory of this script
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# allow X11 forwarding permission
xhost +local:"$USER"

docker run \
  --rm \
  --name keepass \
  --network host \
  --volume /dev/shm:/dev/shm \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume "$HOME"/Development/0__data/keepass:/home/keepass:rw \
  --device /dev/dri \
  --device /dev/video0 \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add video \
  local/keepass $@
  # OR
  # maxmilton/keepass $@
