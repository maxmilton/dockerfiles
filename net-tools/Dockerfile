# Net tools

ARG REGISTRY
FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

LABEL org.opencontainers.image.source=https://github.com/maxmilton/dockerfiles
LABEL org.opencontainers.image.documentation=https://github.com/MaxMilton/dockerfiles/blob/master/net-tools/README.md

RUN set -xe \
  && apk add --no-cache \
    aria2 \
    aria2-doc \
    bash \
    bash-completion \
    bash-doc \
    coreutils \
    coreutils-doc \
    curl \
    curl-doc \
    darkhttpd \
    darkstat \
    darkstat-doc \
    docs \
    drill \
    grep \
    grep-doc \
    htop \
    iperf \
    iperf-doc \
    jq \
    jq-doc \
    less \
    less-doc \
    man-pages \
    mandoc-apropos \
    mtr \
    nmap \
    nmap-doc \
    nmap-ncat \
    nmap-nping \
    nmap-scripts \
    nq \
    nq-doc \
    openssh-client \
    openssh-doc \
    rsync \
    rsync-doc \
    tcpdump \
    tcpdump-doc \
    whois \
    whois-doc

WORKDIR /data
CMD ["/bin/bash"]
