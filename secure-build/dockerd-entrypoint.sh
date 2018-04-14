#!/bin/sh
set -e
set -a

test -e /tmp/.env && source /tmp/.env \
    && envsubst < /tmp/daemon.json.template > /tmp/daemon.json

test -e /tmp/daemon.json && $(cmp -s /tmp/daemon.json /etc/docker/daemon.json || cp /tmp/daemon.json /etc/docker/daemon.json)

set -- dockerd

exec "$@"
