#!/bin/bash
set -euo pipefail

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

# allow X11 forwarding permission
xhost +local:"$USER"

# minimal Midori; no persistence
docker run \
  --rm \
  --name midori \
  --network host \
  --memory 512m \
  --read-only \
  --tmpfs /run:rw,nosuid,nodev \
  --tmpfs /tmp:rw,nosuid,nodev \
  --tmpfs /home/midori:rw,nosuid,nodev,uid=31651,gid=31651,mode=0700,size=4m \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --shm-size=128m \
  --env DISPLAY=unix"$DISPLAY" \
  --cap-drop=all \
  --security-opt no-new-privileges \
  local/midori "$@"
