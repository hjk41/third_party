FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential git wget

RUN cd /opt
RUN git clone https://github.com/mli/third_party.git
RUN cd third_party && ./install.sh /usr/local
RUN cd .. && rm -rf third_party
