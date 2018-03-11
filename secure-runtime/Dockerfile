FROM library/docker:dind

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" \
    | tee -a /etc/apk/repositories \
    && apk update && apk upgrade \    
    && apk add --no-cache gettext iptables ip6tables ufw@testing \
    && mkdir /etc/docker \
    && ufw default deny incoming \
    && ufw default allow outgoing

COPY lock-down-iptables.sh /usr/local/bin
COPY dockerd-entrypoint.sh /usr/local/bin
COPY ufw/before.rules /tmp/before.rules
COPY default/ufw /etc/default/ufw
COPY daemon.json /tmp/daemon.json.template

CMD ["--config-file", "/etc/docker/daemon.json"]
