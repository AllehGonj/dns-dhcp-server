FROM ubuntu:bionic
RUN apt-get update && apt-get install -y \
  iputils-ping \
  dnsutils
CMD bash
