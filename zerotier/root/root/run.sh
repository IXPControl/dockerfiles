#!/bin/bash

#zerotier-one
supervisord -c /etc/supervisor/supervisord.conf

[ ! -z $NETWORK_ID ] && { sleep 5; zerotier-cli join $NETWORK_ID;zerotier-cli set $NETWORK_ID allowGlobal=true; || exit 1; }

[ ! -z $NETWORK_REGIONAL ] && { sleep 5; zerotier-cli join $NETWORK_REGIONAL;zerotier-cli set $NETWORK_REGIONAL allowGlobal=true; || exit 1; }

# something that keep the container running
tail -f /dev/null