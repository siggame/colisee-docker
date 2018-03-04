FROM library/docker:dind

RUN apk update && apk upgrade \    
    && apk add --no-cache gettext

COPY dockerd-entrypoint.sh /usr/local/bin
COPY daemon.json /etc/docker/daemon.json

CMD ["--config-file", "/etc/docker/daemon.json"]
