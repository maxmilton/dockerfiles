#!/bin/bash
set -euo pipefail

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

# allow X11 forwarding permission
xhost +local:"$USER"

# minimal completely fresh chromium for testing with no persistence
docker run \
  --rm \
  --name chromium-test \
  --network host \
  --memory 1g \
  --tmpfs /home/chromium:rw,nosuid,nodev,uid=6007,gid=6007,mode=0700 \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --shm-size=128m \
  --device /dev/snd \
  --device /dev/dri \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add audio \
  --group-add video \
  local/chromium "$@"
