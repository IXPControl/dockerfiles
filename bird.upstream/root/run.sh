[ $IPV4_ENABLE ] && { sleep 5; bird -c /usr/local/etc/bird.conf -d & }

[ $IPV6_ENABLE ] && { sleep 5; bird6 -c /usr/local/etc/bird6.conf -d & }

# something that keep the container running
tail -f /dev/null
