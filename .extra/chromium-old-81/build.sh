#!/bin/sh
set -xe
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
docker build --build-arg REGISTRY=local -t local/chromium-old-81:latest "$script_dir"
