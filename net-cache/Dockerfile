# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM alpine:3.23@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

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
