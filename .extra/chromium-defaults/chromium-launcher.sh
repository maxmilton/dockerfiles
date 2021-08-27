#!/bin/sh
. /etc/chromium/default.conf
export CHROME_WRAPPER=$(readlink -f "$0")
exec "${CHROME_WRAPPER%/*}/chrome" ${CHROMIUM_FLAGS} "$@"
