FROM ubuntu:20.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
    && sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
    subversion gcc qttools5-dev qttools5-dev-tools python3 python3-dev libncurses-dev \
    patch make file g++ wget cpio unzip rsync bc git sudo ca-certificates xz-utils curl \
    qtbase5-dev qtdeclarative5-dev python python-dev python3 python3-dev \ 
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN addgroup --gid 1001 --system ovos && \
    adduser --system --uid 1001 --gid 1001 ovos

USER ovos

ENTRYPOINT ["make"]