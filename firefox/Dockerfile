# Firefox Browser

ARG REGISTRY
FROM alpine:3.22@sha256:55ae5d250caebc548793f321534bc6a8ef1d116f334f18f4ada1b2daad3251b2

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

RUN set -xe \
  && addgroup -g 3153 -S firefox \
  && adduser -D -u 3153 -S -h /home/firefox -s /sbin/nologin -G firefox firefox \
  && adduser firefox audio \
  && adduser firefox video \
  && apk add --no-cache \
    ca-certificates \
    firefox \
    hicolor-icon-theme \
    mesa-egl \
    mesa-gl \
    mesa-gles \
    pciutils-libs \
    unifont \
    xf86-video-amdgpu \
    xf86-video-intel
    # font-noto-all \
    # font-noto-cjk \
    # font-noto-emoji \

# custom options
RUN set -xe \
  && echo -e '\n\
// Disable things that dont make sense in an ephemeral instance\n\
pref("startup.homepage_welcome_url", "");\n\
pref("trailhead.firstrun.didSeeAboutWelcome", true);\n\
pref("datareporting.policy.dataSubmissionPolicyBypassNotification", true);\n\
// Disable things that dont respect user privacy\n\
pref("datareporting.policy.dataSubmissionEnabled", false);\n\
' >> /usr/lib/firefox/browser/defaults/preferences/firefox-branding.js

# custom fontconfig options
COPY local.conf /etc/fonts/local.conf

# run as non privileged user
USER firefox

ENTRYPOINT ["/usr/bin/firefox"]
CMD ["--profile", "/data", "about:blank"]
