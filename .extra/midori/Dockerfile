# Midori Browser

ARG REGISTRY
FROM $REGISTRY/alpine:edge

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

# RUN set -xe \
#   && addgroup -g 31651 -S midori \
#   && adduser -D -u 31651 -S -h /home/midori -s /sbin/nologin -G midori midori \
#   && adduser midori audio \
#   && adduser midori video \
#   && echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
#   && apk add --no-cache \
#     gnome-icon-theme \
#     midori@testing \
#     unifont \
#     xf86-video-amdgpu \
#     xf86-video-intel
RUN set -xe \
  && addgroup -g 31651 -S midori \
  && adduser -D -u 31651 -S -h /home/midori -s /sbin/nologin -G midori midori \
  && apk add --no-cache \
    gnome-icon-theme \
    midori \
    unifont

# run as non privileged user
USER midori

ENTRYPOINT ["/usr/bin/midori"]
# CMD ["about:blank"]
