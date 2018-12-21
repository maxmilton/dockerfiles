# Run net tools in a container
#
# Build or update image:
#   docker build --no-cache -t local/net-tools .
#

FROM alpine:edge@sha256:2b986a08e17a83e68bf9aabef4ff77e61f09bb1ede797efbbc5447105806a3bc

RUN set -xe \
  && apk add --no-cache \
    bash \
    bash-completion \
    bash-doc \
    coreutils \
    coreutils-doc \
    curl \
    curl-doc \
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
    man \
    man-pages \
    mdocml-apropos \
    mtr \
    nmap \
    nmap-doc \
    nmap-ncat \
    nmap-nping \
    nmap-scripts \
    ntop \
    ntop-doc \
    openssh-client \
    openssh-doc \
    tcpdump \
    tcpdump-doc \
    whois \
    whois-doc

WORKDIR /data
CMD ["/bin/bash"]
