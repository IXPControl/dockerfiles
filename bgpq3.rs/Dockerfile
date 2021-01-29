FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/bgpq3.rs"
LABEL version="alpha"

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    git \
    ca-certificates \
    build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /bgpq3 && \
    cd /bgpq3 && \
    git clone https://github.com/snar/bgpq3.git ./ && \
    ./configure && \
    make && \
    make install
	
COPY bgpq3.rs/root/ /root/

CMD ["tail -f /dev/null"]
