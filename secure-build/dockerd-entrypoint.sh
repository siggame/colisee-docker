#!/bin/sh
set -e
set -a

test -e /tmp/.env && source /tmp/.env \
    && envsubst < /etc/docker/daemon.json > /etc/docker/daemon.json

set -- dockerd

exec "$@"
