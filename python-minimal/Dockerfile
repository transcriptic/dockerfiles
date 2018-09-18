ARG PYTHON2_VERSION=2.7
ARG PYTHON3_VERSION=3.5

FROM python:$PYTHON3_VERSION-slim-stretch as python3-build

FROM python:$PYTHON2_VERSION-slim-stretch

MAINTAINER Transcriptic <team@transcriptic.com>

# Copy relevant Python3 files
# TODO: Clean this up and copy only relevant files (works for now since both share core libs from slim-stretch)
COPY --from=python3-build /usr/local/ /usr/local/
COPY --from=python3-build /lib/ /lib/

# Restore py3 links with ldconfig
RUN ldconfig

