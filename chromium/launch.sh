#!/bin/bash
set -euo pipefail

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# allow X11 forwarding permission
xhost +local:"$USER"

# ------------------------------------------------- #

# minimal chromium; no persistence

docker run \
  --rm \
  --name chromium \
  --network host \
  --memory 2g \
  --read-only \
  --tmpfs /run:rw,nosuid,nodev \
  --tmpfs /tmp:rw,nosuid,nodev \
  --tmpfs /data:rw,noexec,nosuid,nodev,uid=6006,gid=6006,mode=0700 \
  --tmpfs /home/chromium:rw,nosuid,nodev,uid=6006,gid=6006,mode=0700,size=4m \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --shm-size=256m \
  --device /dev/snd \
  --device /dev/dri \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add audio \
  --group-add video \
  --cap-drop=all \
  --security-opt no-new-privileges \
  --security-opt seccomp="$script_dir"/seccomp.json \
  local/chromium "$@"

# ------------------------------------------------- #

# chromium with persistence (same as above + extra volumes)

# docker run \
#   --name chromium \
#   --network host \
#   --memory 2g \
#   --read-only \
#   --tmpfs /run:rw,nosuid,nodev \
#   --tmpfs /tmp:rw,nosuid,nodev \
#   --tmpfs /data:rw,noexec,nosuid,nodev,uid=6006,gid=6006,mode=0700 \
#   --tmpfs /home/chromium:rw,nosuid,nodev,uid=6006,gid=6006,mode=0700,size=4m \
#   --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
#   --shm-size=256m \
#   --device /dev/snd \
#   --device /dev/dri \
#   --env DISPLAY=unix"$DISPLAY" \
#   --group-add audio \
#   --group-add video \
#   --cap-drop=all \
#   --security-opt no-new-privileges \
#   --security-opt seccomp="$script_dir"/seccomp.json \
#   --volume /etc/timezone:/etc/timezone:ro \
#   --volume /etc/localtime:/etc/localtime:ro \
#   --volume "$HOME"/Downloads:/home/chromium/Downloads:rw \
#   --volume "$HOME"/.config/chromium/:/data:rw \
#   local/chromium "$@"
