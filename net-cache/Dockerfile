# Proxy for speeding up 💩 networks.

FROM alpine:edge

RUN set -xe \
  && apk add --no-cache \
    squid

COPY squid.conf /etc/squid/
COPY dhparam.pem /etc/squid/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3128/tcp
# CMD ["/usr/sbin/squid", "-NYCd", "1", "-f", "/etc/squid/squid.conf"]
