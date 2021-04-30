# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

RUN set -xe \
  && apk add --no-cache \
    squid

COPY squid.conf /etc/squid/
COPY dhparam.pem /etc/squid/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3128/tcp
