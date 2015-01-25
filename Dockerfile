FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential git wget

RUN cd /opt && git clone https://github.com/mli/third_party.git
RUN cd /opt/third_party && ./install.sh /usr/local
RUN cd /opt && rm -rf third_party
