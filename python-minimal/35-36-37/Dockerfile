# Use Python 3.7 as base image
FROM python:3.5-slim-stretch as py35
FROM python:3.6-slim-stretch as py36
FROM python:3.7-slim-stretch

MAINTAINER Transcriptic <team@transcriptic.com>

# Copy relevant Python3 files
## TODO: Clean this up and copy only relevant files (works for now since all share core libs from slim-stretch)
COPY --from=py35 /usr/local/ /usr/local/
COPY --from=py35 /lib/ /lib/

COPY --from=py36 /usr/local/ /usr/local/
COPY --from=py36 /lib/ /lib/

## Restore py3 links with ldconfig
RUN ldconfig

# Add user `docker` with specified uid
## Default userid=1000 as that is the first non-root userid on linux
ARG uid=1000
RUN useradd -u $uid -m -s /bin/bash docker
ENV HOME /home/docker
## Setting path required for pip install --user
ENV PATH="${HOME}/.local/bin:${PATH}"
## Switch workdir and chown
WORKDIR /home/docker
RUN chown -R docker /home/docker
USER docker

