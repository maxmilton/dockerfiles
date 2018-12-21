# Run net tools in a container
#
# Build or update image:
#   docker build --no-cache -t local/net-tools .
#

FROM alpine:edge@sha256:72fac243935dc4398718b67c2469eafa6ccdca0c6af3ae365d5bba92400c69cd

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
