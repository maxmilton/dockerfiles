#!/bin/bash
set -euo pipefail

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

# allow X11 forwarding permission
xhost +local:"$USER"

# minimal firefox; no persistence
docker run \
  --rm \
  --name firefox \
  --network host \
  --memory 2g \
  --read-only \
  --tmpfs /run:rw,nosuid,nodev \
  --tmpfs /tmp:rw,nosuid,nodev \
  --tmpfs /data:rw,noexec,nosuid,nodev,uid=3153,gid=3153,mode=0700 \
  --tmpfs /home/firefox:rw,nosuid,nodev,uid=3153,gid=3153,mode=0700,size=32m \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --shm-size=256m \
  --device /dev/snd \
  --device /dev/dri \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add audio \
  --group-add video \
  --cap-drop=all \
  --security-opt no-new-privileges \
  local/firefox "$@"
