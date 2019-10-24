#!/bin/sh
set -ex

# https://github.com/StevenBlack/hosts
HOSTS=https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts
HOSTS_FILE=/etc/hosts.block

if [[ -z ${1} ]]; then
  echo "Downloading hosts file..."

  # Download hosts file
  wget "$HOSTS" -O "$HOSTS_FILE"

  # Find line number of end of local host entries
  end_local_hosts=$(grep -n '# End of custom host records.' "$HOSTS_FILE" | cut -f1 -d:)

  # Remove custom local host entries
  # Remove comment lines
  # Remove empty lines
  # Remove broken domains (otherwise dnsmasq won't start)
  sed -i \
    -e "1,$end_local_hosts d" \
    -e 's/#.*$//' \
    -e '/^[[:space:]]*$/d' \
    -e '/^0.0.0.0 -/d' \
    -e '/--/d' \
    "$HOSTS_FILE"

  echo "Starting dnsmasq..."
  exec /usr/sbin/dnsmasq --no-daemon
else
  exec "$@"
fi
