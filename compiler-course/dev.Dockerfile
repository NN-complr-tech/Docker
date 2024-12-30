FROM ubuntu:22.04

LABEL maintainer="https://github.com/NN-complr-tech"

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        git \
        build-essential \
        ninja-build \
        python3 \
        python3-pip \
        wget \
        sudo \
        vim \
        htop

# CMake (3.30.5)
RUN wget https://github.com/Kitware/CMake/releases/download/v3.30.5/cmake-3.30.5-linux-x86_64.tar.gz \
    && tar -xf cmake-3.30.5-linux-x86_64.tar.gz \
    && mv cmake-3.30.5-linux-x86_64 /opt/cmake-3.30.5 \
    && rm cmake-3.30.5-linux-x86_64.tar.gz
ENV PATH="/opt/cmake-3.30.5/bin:$PATH"

# mold (2.35.1)
RUN wget https://github.com/rui314/mold/releases/download/v2.35.1/mold-2.35.1-x86_64-linux.tar.gz \
    && tar -xf mold-2.35.1-x86_64-linux.tar.gz \
    && mv mold-2.35.1-x86_64-linux /opt/mold-2.35.1 \
    && rm mold-2.35.1-x86_64-linux.tar.gz
ENV PATH="/opt/mold-2.35.1/bin:$PATH"

# ccache (4.10.2)
RUN wget https://github.com/ccache/ccache/releases/download/v4.10.2/ccache-4.10.2-linux-x86_64.tar.xz \
    && tar -xf ccache-4.10.2-linux-x86_64.tar.xz \
    && mv ccache-4.10.2-linux-x86_64 /opt/ccache-4.10.2 \
    && rm ccache-4.10.2-linux-x86_64.tar.xz
ENV PATH="/opt/ccache-4.10.2:$PATH"

RUN useradd -m user \
    && usermod -aG sudo user \
    && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user

WORKDIR /home/user

ENTRYPOINT [ "/bin/bash" ]
