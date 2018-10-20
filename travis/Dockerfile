# Run the travis CLI via a container
#
# Build image:
#   docker build -t local/travis .
#
# Update:
#   docker build --no-cache -t local/travis .
#

FROM ruby:alpine@sha256:c31383aac4406dbbc68cfc2ac678e748e95f0acc4e38ffcf8ec1b65a494a85f3

RUN set -xe \
  && apk add --no-cache --virtual .build-deps \
    build-base \
  && apk add --no-cache git \
  && gem install travis --no-rdoc --no-ri \
  && apk del .build-deps \
  # unset SUID on all files
  && for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

WORKDIR project

ENTRYPOINT ["travis"]
