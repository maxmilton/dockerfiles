#!/bin/bash
set -euo pipefail

REGISTRY=${REGISTRY:-'ghcr.io/maxmilton'}

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

# minimal completely fresh chromium for testing with no persistence
/usr/local/bin/docker run \
  --rm \
  --name chromium-defaults \
  --network host \
  --memory 1g \
  --tmpfs /home/chromium:rw,nosuid,nodev,uid=6007,gid=6007,mode=0700 \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --env DISPLAY="$system_ip":0 \
  --security-opt seccomp="$script_dir"/seccomp.json \
  "$REGISTRY"/chromium-defaults "$@"
