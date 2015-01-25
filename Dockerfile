FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential git wget

RUN cd /opt && git clone https://github.com/mli/third_party.git \
    && cd third_party && ./install.sh /usr/local \
    && cd .. && rm -rf third_party
