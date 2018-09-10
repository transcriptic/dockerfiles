FROM debian:stretch-slim

MAINTAINER Transcriptic <team@transcriptic.com>

# Default userid=1000 as that is the first non-root userid on linux
ARG uid=1000

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
        python-dev \
        python \
        python-pip \
        python3-pip \
        python-virtualenv \
        python-setuptools \
        git \
        && rm -rf /var/lib/apt/lists/*


# Change default install directory of pip
RUN mkdir /pip_cache
ENV XDG_CONFIG_HOME /pip_cache

# Change default install directory of eggs
RUN mkdir /python_eggs
ENV PYTHON_EGG_CACHE /python_eggs

# Upgrade pip and virtualenv to enable wheels
RUN pip install -U pip virtualenv setuptools
RUN pip3 install -U pip

# Add user tx with specified uid
RUN useradd -u $uid -m -s /bin/bash tx
ENV HOME /home/tx
WORKDIR /home/tx

RUN chown -R tx /home/tx
USER tx
