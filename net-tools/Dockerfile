# Net tools

ARG REGISTRY
FROM $REGISTRY/alpine:3.13

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
