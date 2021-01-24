FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/bird.upstream"
LABEL version="alpha"

EXPOSE 180

RUN apt-get update && apt-get install -y \
--no-install-recommends \
        autoconf \
    bison \
    build-essential \
    curl \
    flex \
    libreadline-dev \
    libncurses5-dev \
    m4 \
    ca-certificates \
    procps \
    git \
    unzip  && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN curl -O -L ftp://bird.network.cz/pub/bird/bird-1.6.8.tar.gz
RUN tar -xvzf bird-1.6.8.tar.gz

RUN mkdir /etc/bird

RUN cd bird-1.6.8 && \
    autoreconf && \
    ./configure && \
    make && \
    make install

RUN cd bird-1.6.8 && \
    autoreconf && \
    ./configure --enable-ipv6 && \
    make && \
    make install
    
RUN rm -rf /root/bird-1.6.8

COPY bird.upstream/root/ /root/

RUN chmod +x /root/run.sh

CMD /root/run.sh
