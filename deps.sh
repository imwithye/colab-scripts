#!/bin/bash

set -e

checkinstall() {
    command -v $@ 2>&1 >/dev/null
}

checkpipinstall() {
    pip show $@ 2>&1 >/dev/null
}

checkfolder() {
    test -d $@ 2>&1 >/dev/null
}

if ! checkinstall cloudflared; then
    rm -f /tmp/cloudflared.deb
    wget -q -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y /tmp/cloudflared.deb
fi

if ! checkinstall pm2; then
    npm install -g pm2
fi
