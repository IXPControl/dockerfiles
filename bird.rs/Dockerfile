FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/bird.rs"
LABEL version="alpha"

EXPOSE 179

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

RUN mkdir /bgpq3 && \
    cd /bgpq3 && \
    git clone https://github.com/snar/bgpq3.git ./ && \
    ./configure && \
    make && \
    make install

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

COPY root/ /root/

RUN chmod +x /root/run.sh

CMD /root/run.sh