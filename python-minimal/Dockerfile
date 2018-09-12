FROM python:3.5-slim-stretch as python3-build

FROM python:2.7-slim-stretch

MAINTAINER Transcriptic <team@transcriptic.com>

# Copy python3 from build
# TODO: Clean this up and copy only relevant files (works for now since both share core libs from slim-stretch)
COPY --from=python3-build /usr/local/ /usr/local/
COPY --from=python3-build /lib/ /lib/
# Restore py3 links with ldconfig
RUN ldconfig

# Default userid=1000 as that is the first non-root userid on linux
ARG uid=1000

# Add user tx with specified uid
RUN useradd -u $uid -m -s /bin/bash tx
ENV HOME /home/tx
# Required for pip install --user
ENV PATH="${HOME}/.local/bin:${PATH}"
WORKDIR /home/tx

RUN chown -R tx /home/tx
USER tx

