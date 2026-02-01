# Google Cloud SDK
# https://cloud.google.com/sdk/docs
# https://github.com/GoogleCloudPlatform/cloud-sdk-docker/blob/master/alpine/Dockerfile

# It's recommended to mount a volume at /home/gcloud
# https://github.com/maxmilton/dotfiles/blob/master/private_dot_config/fish/functions/gcloud-sdk.fish

ARG REGISTRY
FROM alpine:3.22@sha256:55ae5d250caebc548793f321534bc6a8ef1d116f334f18f4ada1b2daad3251b2

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

# https://cloud.google.com/sdk/docs/release-notes
ENV CLOUD_SDK_VERSION=548.0.0
ENV PATH /google-cloud-sdk/bin:$PATH

RUN set -xe \
  && addgroup -g 21006 -S gcloud \
  && adduser -D -u 21006 -S -h /home/gcloud -s /sbin/nologin -G gcloud gcloud \
  && apk --no-cache add \
    curl \
    openssh-client \
    python3 \
  && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && gcloud config set core/disable_usage_reporting true \
  && gcloud config set component_manager/disable_update_check true \
  && gcloud config set metrics/environment github_docker_image \
  && gcloud config set survey/disable_prompts true
  # && gcloud components install \
  #   beta \
  #   kubectl

USER gcloud
WORKDIR /data
CMD ["gcloud"]
