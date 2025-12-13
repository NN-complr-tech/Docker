FROM ubuntu:22.04

ARG CANN_VERSION="8.2.RC1"
ARG NUMPY_VERSION="1.26.4"

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        cmake \
        git \
        build-essential \
        gdb \
        python3 \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir "numpy==${NUMPY_VERSION}"

WORKDIR /root

COPY cann_dir/ ./

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN chmod +x "Ascend-cann-toolkit_${CANN_VERSION}_linux-$(arch).run"
RUN echo "y" | "./Ascend-cann-toolkit_${CANN_VERSION}_linux-$(arch).run" --full
RUN rm -f -- ./*.run

CMD [ "/bin/bash", "-c", "source /usr/local/Ascend/ascend-toolkit/latest/bin/setenv.bash && exec /bin/bash" ]
