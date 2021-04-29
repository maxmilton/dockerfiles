#!/bin/bash
set -euo pipefail

system_ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# revoke X11 forwarding permission and kill all child jobs (socat) on exit
set -o errtrace
trap 'exit' INT TERM
trap '/opt/X11/bin/xhost - $system_ip; kill 0' EXIT

# allow X11 forwarding permission
/opt/X11/bin/xhost + "$system_ip"

# forward xserver
/usr/local/bin/socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:"$DISPLAY" &

# minimal chromium; no persistence
/usr/local/bin/docker run \
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
  --env DISPLAY="$system_ip":0 \
  --cap-drop=all \
  --cap-add SYS_ADMIN \
  --security-opt no-new-privileges \
  --security-opt seccomp="$script_dir"/seccomp.json \
  local/chromium "$@"
