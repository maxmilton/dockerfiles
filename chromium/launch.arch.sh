#!/bin/bash
set -euo pipefail

# README:
#   On Arch Linux audio needs additional options

REGISTRY=${REGISTRY:-'ghcr.io/maxmilton'}

# revoke X11 forwarding permission on exit
set -o errtrace
trap 'xhost -local:$USER' EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# allow X11 forwarding permission
xhost +local:"$USER"

# Arch Linux version with special sound configuration
# NOTE: Adjust ALSA output device as required
docker run \
  --rm \
  --name chromium \
  --network host \
  --memory 3gb \
  --read-only \
  --tmpfs /run:rw,nosuid,nodev \
  --tmpfs /tmp:rw,nosuid,nodev \
  --tmpfs /data:rw,noexec,nosuid,nodev,uid=6006,gid=6006,mode=0700 \
  --tmpfs /home/chromium:rw,nosuid,nodev,uid=6006,gid=6006,mode=0700,size=4m \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --volume "$XDG_RUNTIME_DIR"/pulse/native:"$XDG_RUNTIME_DIR"/pulse/native:ro \
  --shm-size=512m \
  --device /dev/snd \
  --device /dev/dri \
  --env DISPLAY=unix"$DISPLAY" \
  --env PULSE_SERVER=unix:"$XDG_RUNTIME_DIR"/pulse/native \
  --group-add "$(getent group audio | cut -d: -f3)" \
  --group-add video \
  --cap-drop=all \
  --security-opt no-new-privileges \
  --security-opt seccomp="$script_dir"/seccomp.json \
  "$REGISTRY"/chromium --alsa-output-device=hw:0,0 about:blank "$@"
