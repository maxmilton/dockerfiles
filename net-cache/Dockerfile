# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

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
