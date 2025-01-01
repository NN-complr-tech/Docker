FROM ubuntu:22.04

LABEL maintainer="https://github.com/NN-complr-tech"

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        git \
        cmake \
        ccache \
        mold \
        build-essential \
        ninja-build \
        python3 \
        python3-pip \
        wget \
        sudo \
        vim \
        htop

RUN useradd -m user \
    && usermod -aG sudo user \
    && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user

WORKDIR /home/user

ENTRYPOINT [ "/bin/bash" ]
