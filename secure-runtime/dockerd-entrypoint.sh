#!/bin/sh -ae

test -e /tmp/.env && source /tmp/.env \
    && envsubst < /etc/docker/daemon.json > /etc/docker/daemon.json

set -- dockerd

/usr/local/bin/lock-down-iptables.sh &

exec "$@"
