#!/bin/bash
set -x
# set -vx
#set -euo pipefail
#IFS=$'\n\t'

# README:
#   On Arch Linux the image doesn't work out of the box and needs the extra
#   "--cap-add SYS_ADMIN" line plus some others removed. Since this is insecure,
#   only use this launch script if truly necessary.

# revoke X11 forwarding permission on exit
# set -o errtrace
# trap 'xhost -local:$USER' EXIT

# directory of this script
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# allow X11 forwarding permission
xhost +local:"$USER"

xhost +local:root
xhost +local:docker

# minimal chromium; no persistence; insecure
docker run \
  --rm \
  --name chromium \
  --network host \
  --memory 2gb \
  --read-only \
  --tmpfs /run:rw,nosuid,nodev \
  --tmpfs /tmp:rw,nosuid,nodev \
  --tmpfs /data:rw,noexec,nosuid,nodev,uid=6006,gid=6006,mode=0700 \
  --tmpfs /home/chromium:rw,nosuid,nodev,uid=6006,gid=6006,mode=0700,size=4m \
  --volume /dev/shm:/dev/shm \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --device /dev/snd \
  --device /dev/dri \
  --device /dev/video0 \
  --env DISPLAY=unix"$DISPLAY" \
  --group-add audio \
  --group-add video \
  --cap-add SYS_ADMIN \
  --security-opt seccomp="$DIR"/seccomp.json \
  local/chromium "$@"

# Arch Linux version with special sound configuration and extra Japanese fonts
# NOTE: Edit or remove the extra font line and alsa device
# docker run \
#   --rm \
#   --name chromium \
#   --network host \
#   --memory 2gb \
#   --read-only \
#   --tmpfs /run:rw,nosuid,nodev \
#   --tmpfs /tmp:rw,nosuid,nodev \
#   --tmpfs /data:rw,noexec,nosuid,nodev,uid=6006,gid=6006,mode=0700 \
#   --tmpfs /home/chromium:rw,nosuid,nodev,uid=6006,gid=6006,mode=0700,size=4m \
#   --volume /dev/shm:/dev/shm \
#   --volume /tmp/.X11-unix:/tmp/.X11-unix \
# 	--volume "$XDG_RUNTIME_DIR"/pulse/native:"$XDG_RUNTIME_DIR"/pulse/native \
#   --device /dev/snd \
#   --device /dev/dri \
#   --device /dev/video0 \
#   --env DISPLAY=unix"$DISPLAY" \
# 	--env PULSE_SERVER=unix:"$XDG_RUNTIME_DIR"/pulse/native \
#   --group-add video \
# 	--group-add "$(getent group audio | cut -d: -f3)" \
#   --cap-add SYS_ADMIN \
#   --security-opt seccomp="$DIR"/seccomp.json \
#   \
#   --volume /usr/share/fonts/uddigikyokasho:/usr/share/fonts/uddigikyokasho \
#   \
#   local/chromium --alsa-output-device=hw:0,3 about:blank
