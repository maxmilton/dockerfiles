# Chromium Browser
# NOTE: See default.conf for all custom Chromium settings

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

RUN set -xe \
  && addgroup -g 6006 -S chromium \
  && adduser -D -u 6006 -S -h /home/chromium -s /sbin/nologin -G chromium chromium \
  && adduser chromium audio \
  && adduser chromium video \
  && apk add --no-cache --virtual .system-deps \
    tzdata \
  && apk add --no-cache \
    chromium \
    libcanberra-gtk3 \
    mesa-egl \
    mesa-gl \
    mesa-gles \
    unifont \
    xf86-video-amdgpu \
    xf86-video-intel \
    # font-noto-all \
    # font-noto-cjk \
    # font-noto-emoji \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

# custom launcher script
COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh

# custom options
COPY default.conf /etc/chromium/default.conf

# custom fontconfig options
COPY local.conf /etc/fonts/local.conf

# run as non privileged user
USER chromium

ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
