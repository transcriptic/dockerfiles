FROM python:3.5-slim-stretch as python3-build

FROM python:2.7-slim-stretch

MAINTAINER Transcriptic <team@transcriptic.com>

# Copy python3 from build
COPY --from=python3-build /usr/local/bin/python3 /usr/local/bin/python3
COPY --from=python3-build /usr/local/bin/pip3 /usr/local/bin/pip3
COPY --from=python3-build /usr/local/bin/python3-config /usr/local/bin/python3-config

# Default userid=1000 as that is the first non-root userid on linux
ARG uid=1000

# Add user tx with specified uid
RUN useradd -u $uid -m -s /bin/bash tx
ENV HOME /home/tx
ENV PATH="${HOME}/.local/bin:${PATH}"
WORKDIR /home/tx

RUN chown -R tx /home/tx
USER tx
