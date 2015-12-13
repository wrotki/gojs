FROM debian:jessie
MAINTAINER Mariusz Borsa wrotki@msn.com

RUN apt-get update && apt-get install -y \
   wget \
   git \
   make \
   python \
   lbzip2 \
   clang \
   gcc \
   g++ \
   pkg-config
RUN mkdir -p /src
WORKDIR /src

RUN  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
  && git clone https://github.com/ry/v8worker.git \
  && wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz \
  && echo done
ENV GOPATH /
ENV PATH /src/depot_tools:${PATH}:/usr/local/go/bin
WORKDIR /src/v8worker
RUN make install

CMD ["/bin/bash"]
