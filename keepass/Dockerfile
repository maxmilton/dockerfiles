# Run the KeePassX password manager in a container

ARG REGISTRY
FROM $REGISTRY/alpine:edge

RUN set -xe \
  && addgroup -g 5339 -S keepass \
  && adduser -D -u 5339 -S -h /home/keepass -s /sbin/nologin -G keepass keepass \
  && adduser keepass video \
  && apk add --no-cache \
    keepassx \
    ttf-inconsolata

# run as non privileged user
USER keepass
WORKDIR /home/keepass

ENTRYPOINT ["/usr/bin/keepassx"]
