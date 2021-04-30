#!/bin/sh
set -eu

# Based on https://github.com/philpep/dockerfiles/blob/a2c3a858cb08427149875d40e085f701e62e160d/check_update.sh

if test -f /.dockerenv; then
  if test -x /sbin/apk; then
    apk --no-cache list -u | grep 'upgradable from' && exit 1
  elif test -x /usr/bin/apt-get; then
    apt-get update > /dev/null
    apt list --upgradable 2>/dev/null | grep 'upgradable from' && exit 1
  elif test -x /usr/bin/yum; then
    yum check-update || exit 1
  fi
  exit 0
fi
if test -z "$1"; then
  >&2 echo "$0 require image as argument"
  exit 64
fi
if docker run --rm --entrypoint sh -u root -v $(readlink -f $0):/check_update.sh $1 /check_update.sh; then
  echo -e "\e[0;32m$1 is up-to-date\e[0m"
elif expr match "$1" ".*alpine:builder\$"; then
  # skip over alpine:builder since it uses a base image we don't control
  exit 0
else
  echo -e "\e[0;31m$1 needs update\e[0m" && exit 1
fi
