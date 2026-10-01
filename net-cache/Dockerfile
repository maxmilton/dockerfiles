# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles
LABEL org.opencontainers.image.documentation=https://github.com/MaxMilton/dockerfiles/blob/master/net-cache/README.md

RUN set -xe \
  && apk add --no-cache \
    squid

COPY squid.conf /etc/squid/
COPY dhparam.pem /etc/squid/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3128/tcp
