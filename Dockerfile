#FROM ubuntu:wily
FROM debian:jessie
MAINTAINER Mariusz Borsa wrotki@msn.com

#RUN echo "deb http://archive.ubuntu.com/ubuntu wily main universe" > /etc/apt/sources.list \
RUN apt-get update && apt-get install -y \
   wget \
   git \
   make \
   python \
   lbzip2 

RUN  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
  && git clone https://github.com/ry/v8worker.git \
  && echo done
ENV PATH /depot_tools:${PATH}
WORKDIR /v8worker
#RUN make

CMD ["/bin/bash"]
