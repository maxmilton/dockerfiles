# Chromium Browser OLD VERSION 53

FROM alpine:3.4

RUN set -xe \
  && addgroup -g 6008 -S chromium-old-53 \
  && adduser -D -u 6008 -S -h /home/chromium-old-53 -s /sbin/nologin -G chromium-old-53 chromium-old-53 \
  && adduser chromium-old-53 audio \
  && adduser chromium-old-53 video \
  && apk add --no-cache --virtual .system-deps \
    tzdata \
  && apk add --no-cache \
    chromium=53.0.2785.92-r2 \
    libcanberra-gtk3 \
    libexif \
    ttf-liberation \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh
COPY default.conf /etc/chromium/default.conf

USER chromium-old-53
ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
