#!/bin/sh -ae

ufw enable

until docker info
do
    sleep 0.1
done

docker network create --subnet 172.100.0.0/16 -o "com.docker.network.bridge.name"="main" main

test -e /tmp/.env && source /tmp/.env

SAFE_RUNNER=$(getent hosts "$RUNNER_HOST" | awk '{ print $1 }')
SAFE_GAME_SERVER=$(getent hosts "$GAME_SERVER_HOST" | awk '{ print $1 }')

cp /tmp/before.rules /etc/ufw/before.rules
ufw allow proto tcp from "$SAFE_RUNNER" to any port 2375
ufw allow proto tcp from 172.100.0.0/16 to "$SAFE_GAME_SERVER" port "$GAME_SERVER_PORT"
ufw deny out from 172.100.0.0/16
ufw reload
