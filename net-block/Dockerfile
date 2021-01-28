# Net block; ad blocking DNS server

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

RUN set -xe \
  && apk add --no-cache \
    dnsmasq

COPY dnsmasq.conf /etc/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 53/udp
