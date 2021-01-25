FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/bgpq4.rs"
LABEL version="alpha"

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    git \
    ca-certificates \
    build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /bgpq4 && \
    cd /bgpq4 && \
    git clone https://github.com/bgp/bgpq4.git ./ && \
    ./configure && \
    make && \
    make install

CMD ["tail -f /dev/null"]
