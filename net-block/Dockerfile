# Net block; ad blocking DNS server

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

RUN set -xe \
  && apk add --no-cache \
    dnsmasq

COPY dnsmasq.conf /etc/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 53/udp
