FROM ubuntu:20.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
    && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
    subversion gcc qttools5-dev qttools5-dev-tools python3 python3-dev \
    patch make file g++ wget cpio unzip rsync bc git sudo ca-certificates \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1001 --system ovos && \
    adduser --system --uid 1001 --gid 1001 ovos

USER ovos

ADD . /opt

WORKDIR /opt

RUN git submodule update --init --recursive

ENTRYPOINT ["make", "clean", "rpi4_64-gui-config", "rpi4_64-gui"]