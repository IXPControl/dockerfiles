#!/bin/bash
export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin

if [ ! -e /dev/net/tun ]; then
	echo 'FATAL: cannot start ZeroTier One in container: /dev/net/tun not present.'
	exit 1
fi

#zerotier-one
supervisord -c /etc/supervisor/supervisord.conf

if [ ! -e /var/lib/zerotier-one/networks.d/$NETWORK_ID.conf ]; then
	sleep 3;
  zerotier-cli join $NETWORK_ID;
  zerotier-cli set $NETWORK_ID allowGlobal=true;
fi

if [ ! -e /var/lib/zerotier-one/networks.d/$NETWORK_REGIONAL.conf ]; then
	sleep 3; 
  zerotier-cli join $NETWORK_REGIONAL;
  zerotier-cli set $NETWORK_REGIONAL allowGlobal=true;
fi

# something that keep the container running
tail -f /dev/null
