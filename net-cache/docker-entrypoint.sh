#!/bin/sh
set -e

if [[ -z ${1} ]]; then
  /usr/lib/squid/security_file_certgen -c -s /var/lib/ssl_db -M 4MB
  touch /var/cache/squid/netdb.state
  chown -R squid:squid /var/cache/squid /var/lib/ssl_db /dev/stdout
  chmod ugo+w /dev/stdout

  if [[ ! -d /var/cache/squid/00 ]]; then
    echo "Initializing cache..."
    /usr/sbin/squid -Nz -f /etc/squid/squid.conf
  fi

  echo "Starting squid..."
  exec /usr/sbin/squid -NYCd 1 -f /etc/squid/squid.conf
else
  exec "$@"
fi
