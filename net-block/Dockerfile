# Net block; ad blocking DNS server

ARG REGISTRY
FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles
LABEL org.opencontainers.image.documentation=https://github.com/MaxMilton/dockerfiles/blob/master/net-block/README.md

RUN set -xe \
  && apk add --no-cache \
    dnsmasq

COPY dnsmasq.conf /etc/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 53/udp
