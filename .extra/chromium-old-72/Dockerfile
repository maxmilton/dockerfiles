# Chromium Browser OLD VERSION 72

FROM alpine:3.15

RUN set -xe \
  && addgroup -g 6008 -S chromium-old-72 \
  && adduser -D -u 6008 -S -h /home/chromium-old-72 -s /sbin/nologin -G chromium-old-72 chromium-old-72 \
  && adduser chromium-old-72 audio \
  && adduser chromium-old-72 video \
  && apk add --no-cache --virtual .system-deps \
    tzdata \
  && apk add --no-cache \
    chromium=72.0.3626.121-r0 \
    libcanberra-gtk3 \
    libexif \
    ttf-liberation \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh
COPY default.conf /etc/chromium/default.conf

USER chromium-old-72
ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
