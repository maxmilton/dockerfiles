#!/bin/bash
set -euo pipefail

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

# allow X11 forwarding permission
xhost +local:"$USER"

docker run \
  --rm \
  --name chromium-old-81 \
  --network host \
  --memory 1g \
  --tmpfs /home/chromium-old-81:rw,uid=6008,gid=6008 \
  --tmpfs /data:rw,uid=6008,gid=6008 \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --shm-size=128m \
  --env DISPLAY=unix"$DISPLAY" \
  --cap-add=SYS_ADMIN \
  local/chromium-old-81 "$@"
