# Run the travis CLI via a container
#
# Build image:
#   docker build -t local/travis .
#
# Update:
#   docker build --no-cache -t local/travis .
#

FROM ruby:alpine@sha256:e4c6f2fbbc13717e30a27d3575dd7168dd180dd7c0973810341b3617dfd8017b

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
