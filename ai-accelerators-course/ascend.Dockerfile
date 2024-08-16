FROM ubuntu:22.04

ARG CANN_VERSION="8.0.RC3.alpha001"

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
        cmake \
        git \
        build-essential \
        python3 \
        python3-pip

RUN pip install numpy

COPY cann_dir .

RUN chmod +x Ascend-cann-toolkit_${CANN_VERSION}_linux-x86_64.run
RUN echo "y" | ./Ascend-cann-toolkit_${CANN_VERSION}_linux-x86_64.run --full
RUN rm Ascend-cann-toolkit_${CANN_VERSION}_linux-x86_64.run

WORKDIR /root

CMD [ "/bin/bash", "-c", "source /usr/local/Ascend/ascend-toolkit/set_env.sh && exec /bin/bash" ]
