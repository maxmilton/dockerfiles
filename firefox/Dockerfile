# Firefox Browser

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

RUN set -xe \
  && addgroup -g 3153 -S firefox \
  && adduser -D -u 3153 -S -h /home/firefox -s /sbin/nologin -G firefox firefox \
  && adduser firefox audio \
  && adduser firefox video \
  && apk add --no-cache \
    ca-certificates \
    firefox \
    hicolor-icon-theme \
    mesa-gl \
    mesa-gles \
    unifont \
    xf86-video-amdgpu \
    xf86-video-intel \
    # font-noto-all \
    # font-noto-cjk \
    # font-noto-emoji \
  && mkdir /etc/firefox \
  && echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js

# custom fontconfig options
COPY ../chromium/local.conf /etc/fonts/local.conf

# run as non privileged user
USER firefox

ENTRYPOINT ["/usr/bin/firefox"]
CMD ["about:blank"]
