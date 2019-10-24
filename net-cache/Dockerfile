# Net cache; proxy for speeding up 💩 networks and reducing data use

ARG REGISTRY
FROM $REGISTRY/alpine:edge

RUN set -xe \
  && apk add --no-cache \
    squid

COPY squid.conf /etc/squid/
COPY dhparam.pem /etc/squid/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3128/tcp
