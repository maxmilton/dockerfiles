# Net tools

ARG REGISTRY
FROM $REGISTRY/alpine:edge

RUN set -xe \
  && apk add --no-cache \
    aria2 \
    bash \
    bash-completion \
    coreutils \
    curl \
    darkhttpd \
    darkstat \
    drill \
    grep \
    htop \
    iperf \
    jq \
    less \
    man-pages \
    mandoc-apropos \
    mtr \
    nmap \
    nmap-ncat \
    nmap-nping \
    nmap-scripts \
    openssh-client \
    rsync \
    tcpdump \
    whois
    # aria2-doc \
    # bash-doc \
    # coreutils-doc \
    # curl-doc \
    # darkstat-doc \
    # docs \
    # grep-doc \
    # iperf-doc \
    # jq-doc \
    # less-doc \
    # nmap-doc \
    # openssh-doc \
    # rsync-doc \
    # tcpdump-doc \
    # whois-doc

WORKDIR /data
CMD ["/bin/bash"]
