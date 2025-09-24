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

apt update
apt install -qq -y tmux fzf

# Cloudflared
if ! checkinstall cloudflared; then
    rm -f /tmp/cloudflared.deb
    wget -q -O /tmp/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y /tmp/cloudflared.deb
    rm -f /tmp/cloudflared.deb
fi

# NodeJS
if ! checkinstall nvm; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    source /home/ubuntu/.nvm/nvm.sh
    nvm install --lts
fi

# Bun JavaScript
if ! checkinstall bun; then
    curl -fsSL https://bun.sh/install | bash
fi

# http-server
if ! checkinstall pm2; then
    bun install -g pm2
fi

# pm2
if ! checkinstall pm2; then
    bun install -g pm2
fi
