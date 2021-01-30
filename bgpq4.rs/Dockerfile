FROM debian:buster-slim

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
    ARG BUILD_DATE
    ARG VCS_REF
    ARG VERSION
    LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="IXPControl.BGPQ4.RS" \
          org.label-schema.description="BGPQ4 Install for IXPControl" \
          org.label-schema.url="https://wiki.ixpcontrol.com/docker-image/bgpq4.rs" \
          org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/IXPControl/dockerfiles/bgpq4.rs" \
          org.label-schema.vendor="IXPControl.com" \
          org.label-schema.version=$VERSION \
          org.label-schema.schema-version="1.0"

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y git build-essential autoconf automake markdown && rm -rf /var/lib/apt/lists/*

# Add source code
RUN git clone https://github.com/bgp/bgpq4.git /src
WORKDIR /src
COPY bgpq4.rs/root/ /root/
RUN chmod +x /root/bgpq4/*.sh
# Run steps
RUN ./bootstrap
RUN ./configure
RUN make install

CMD tail -f /dev/null
