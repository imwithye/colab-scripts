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

if ! checkfolder /content/drive/MyDrive; then
    echo "Google Drive not mounted. Please mount Google Drive in the Colab interface."
    exit 1
fi

mkdir -p /content
mkdir -p /content/drive/MyDrive/Workspace

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="/content/drive/MyDrive/Workspace"

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
