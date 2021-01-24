FROM ubuntu:focal

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/zerotier.multi"
LABEL version="alpha"

EXPOSE 179

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    curl \
    screen \
    supervisor \
    gnupg \
    procps && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*



RUN curl -L -o /tmp/zerotier-install.sh https://install.zerotier.com/ && bash /tmp/zerotier-install.sh || exit 0

COPY zerotier/root/ /
RUN chmod +x /root/run.sh

ENTRYPOINT /root/run.sh
