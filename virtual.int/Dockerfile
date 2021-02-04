FROM ubuntu:focal

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/virtual.int"
LABEL version="alpha"

#EXPOSE VXLAN
EXPOSE 4789
#EXPOSE GRETAP / EOIP
EXPOSE 1723
#EXPOSE ZeroTier
EXPOSE 9993
#EXPOSE OpenVPN
EXPOSE 1194/udp
#EXPOSE WireGuard
EXPOSE 51820

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    curl \
    supervisor \
    gnupg \
    ca-certificates \
    procps \
    iproute2 \
	iptables \
	automake \
	libtool \
	make \
	wireguard-tools \ 
	iptables \ 
	nano \
	net-tools \
	openresolv \
	inotify-tools \
	openvpn \
	easy-rsa\
	netcat-openbsd \
	zip \
	dumb-init\
	&& \
	apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*


# Install EoIP
RUN mkdir -p /usr/src/eoip && \
	wget --no-check-certificate -q https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/linux-eoip/linux-eoip-0.5.tgz -O /usr/src/eoip.tgz && \
	tar -xzf /usr/src/eoip.tgz --strip 1 -C /usr/src/eoip && \
	cd /usr/src/eoip && \
	./bootstrap.sh && ./configure && make && make install

#install ZeroTier
RUN curl -L -o /tmp/zerotier-install.sh https://install.zerotier.com/ && \
	bash /tmp/zerotier-install.sh || exit 0
	
#install/configure OpenVPN
RUN    mkdir -p /root/ixpcontrol/ovpn && \
    cd /root/ixpcontrol/ovpn && \
    /usr/share/easy-rsa/easyrsa init-pki && \
    /usr/share/easy-rsa/easyrsa gen-dh && \
    cp pki/dh.pem /etc/openvpn
	
#install Wireguard

COPY virtual.int/root/ /
RUN chmod +x /root/run.sh

ENTRYPOINT /root/run.sh
