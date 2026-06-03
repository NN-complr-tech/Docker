FROM ubuntu:24.04

LABEL maintainer="https://github.com/NN-complr-tech"

ARG JPLAG_VERSION="v6.3.0"
ARG NODE_VERSION="20"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get upgrade -y && apt-get install -y -q --no-install-recommends \
    sudo \
    git \
    curl \
    maven \
    openjdk-25-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash \
    && apt-get install -y -q --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m user \
    && usermod -aG sudo user \
    && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER user
WORKDIR /home/user

RUN git clone --depth 1 -b ${JPLAG_VERSION} https://github.com/jplag/JPlag.git jplag
WORKDIR /home/user/jplag
RUN mvn -P with-report-viewer clean package assembly:single

WORKDIR /home/user

CMD ["/bin/bash"]
