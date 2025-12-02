# Chromium Browser OLD VERSION 47

FROM alpine:3.3@sha256:6bff6f65597a69246f79233ef37ff0dc50d97eaecbabbe4f8a885bf358be1ecf

RUN set -xe \
  && addgroup -g 6008 -S chromium-old-47 \
  && adduser -D -u 6008 -S -h /home/chromium-old-47 -s /sbin/nologin -G chromium-old-47 chromium-old-47 \
  && adduser chromium-old-47 audio \
  && adduser chromium-old-47 video \
  && apk add --no-cache --virtual .system-deps \
    tzdata \
  && apk add --no-cache \
    chromium=47.0.2526.106-r0 \
    libcanberra-gtk2 \
    libexif \
    ttf-liberation \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh
COPY default.conf /etc/chromium/default.conf

USER chromium-old-47
ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
