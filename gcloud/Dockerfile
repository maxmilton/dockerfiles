# Google Cloud SDK
# https://cloud.google.com/sdk/docs

# FROM docker:19.03.6 as static-docker-source

ARG REGISTRY
FROM alpine:3.15

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles

# https://cloud.google.com/sdk/docs/release-notes
ENV CLOUD_SDK_VERSION=340.0.0
ENV CLOUDSDK_PYTHON=python3

ENV PATH /google-cloud-sdk/bin:$PATH
# COPY --from=static-docker-source /usr/local/bin/docker /usr/local/bin/docker

RUN set -xe \
  && apk --no-cache add \
    curl \
    openssh-client \
    python3 \
    # bash \
    # git \
    # gnupg \
    # libc6-compat \
    # py3-crcmod \
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

WORKDIR /data
VOLUME ["/root/.config"]
VOLUME ["/root/.ssh"]
