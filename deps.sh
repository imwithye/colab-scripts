#!/bin/bash

set -ex

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

checkinstall() {
  command -v $@ 2>&1 >/dev/null
}

checkpipinstall() {
  pip show $@ 2>&1 >/dev/null
}

if ! checkinstall pm2; then
    npm install -g pm2
fi

if ! checkinstall cloudflared; then
    curl -o /usr/local/bin/cloudflared -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    chmod +x /usr/local/bin/cloudflared
fi

if ! checkpipinstall lightning; then
    pip install lightning
fi
