#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

# directory of this script
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# allow X11 forwarding permission
xhost +local:"$USER"

docker run \
  --rm \
  --name fontforge \
  --network host \
  --volume /dev/shm:/dev/shm \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume "$HOME"/Development/0__data/fontforge:/home/fontforge:rw \
  --device /dev/dri \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add video \
  local/fontforge $@
  # OR
  # maxmilton/fontforge $@

  #--device /dev/video0 \
