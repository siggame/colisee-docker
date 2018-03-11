FROM library/docker:dind

RUN apk update && apk upgrade \    
    && apk add --no-cache gettext \
    && mkdir /etc/docker

COPY dockerd-entrypoint.sh /usr/local/bin
COPY daemon.json /tmp/daemon.json.template

CMD ["--config-file", "/etc/docker/daemon.json"]
