# Run the Chromium browser in a container
#
# Build or update image:
#   docker build --no-cache -t local/chromium .
#

FROM alpine:edge@sha256:72fac243935dc4398718b67c2469eafa6ccdca0c6af3ae365d5bba92400c69cd

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
    mesa-dri-intel \
    mesa-gl \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

# override default launcher
COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh

# custom chromium flags
COPY default.conf /etc/chromium/default.conf

# custom font config
COPY local.conf /etc/fonts/local.conf

# run as non privileged user
USER chromium

ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
