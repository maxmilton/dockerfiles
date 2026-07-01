# Net tools

ARG REGISTRY
FROM alpine:3.24@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

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
