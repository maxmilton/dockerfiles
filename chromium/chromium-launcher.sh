#!/bin/sh
# shellcheck disable=SC1091
. /etc/chromium/default.conf
CHROME_WRAPPER="$(readlink -f "$0")"
export CHROME_WRAPPER
# shellcheck disable=SC2086
exec "${CHROME_WRAPPER%/*}/chrome" ${CHROMIUM_FLAGS} "$@"
