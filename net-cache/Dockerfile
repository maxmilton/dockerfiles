# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM alpine:3.22@sha256:310c62b5e7ca5b08167e4384c68db0fd2905dd9c7493756d356e893909057601

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
