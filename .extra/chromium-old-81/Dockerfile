# Chromium Browser OLD VERSION 81

FROM alpine:3.18

RUN set -xe \
  && addgroup -g 6008 -S chromium-old-81 \
  && adduser -D -u 6008 -S -h /home/chromium-old-81 -s /sbin/nologin -G chromium-old-81 chromium-old-81 \
  && adduser chromium-old-81 audio \
  && adduser chromium-old-81 video \
  && apk add --no-cache --virtual .system-deps \
    tzdata \
  && apk add --no-cache \
    chromium=81.0.4044.113-r0 \
    libcanberra-gtk3 \
    unifont \
  && cp /usr/share/zoneinfo/UTC /etc/localtime \
  && echo "UTC" > /etc/timezone \
  && apk del .system-deps

COPY chromium-launcher.sh /usr/lib/chromium/chromium-launcher.sh
COPY default.conf /etc/chromium/default.conf

USER chromium-old-81
ENTRYPOINT ["/usr/bin/chromium-browser"]
CMD ["about:blank"]
