FROM ubuntu:focal

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/zerotier.slave"
LABEL version="alpha"

#EXPOSE VXLAN
EXPOSE 4789
#EXPOSE GRETAP / EOIP
EXPOSE 1723
#EXPOSE ZeroTier
EXPOSE 9993

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    curl \
    supervisor \
    gnupg \
    wget \
    ca-certificates \
    make \
    automake \
    build-essential \
    procps 	&& \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*



#Install ZeroTier
RUN curl -L -o /tmp/zerotier-install.sh https://install.zerotier.com/ && \
	bash /tmp/zerotier-install.sh || exit 0

# Install EoIP
RUN mkdir -p /usr/src/eoip && \
	wget --no-check-certificate -q https://downloads.ixpcontrol.com/eoip/linux-eoip-0.5.tgz -O /usr/src/eoip.tgz && \
	tar -xzf /usr/src/eoip.tgz --strip 1 -C /usr/src/eoip && \
	cd /usr/src/eoip && \
	./bootstrap.sh && ./configure && make && make install

COPY virtual.int/root/ /
RUN chmod +x /root/run.sh

ENTRYPOINT /root/run.sh
