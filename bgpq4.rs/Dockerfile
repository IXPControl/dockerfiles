FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/bgpq4.rs"
LABEL version="alpha"

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y git build-essential autoconf automake markdown && rm -rf /var/lib/apt/lists/*

# Add source code
RUN git clone https://github.com/bgp/bgpq4.git /src
WORKDIR /src

# Run steps
RUN ./bootstrap
RUN ./configure
RUN make
RUN make check
RUN make distcheck

CMD tail -f /dev/null
