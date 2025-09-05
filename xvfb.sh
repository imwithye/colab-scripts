#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/deps.sh

if ! checkinstall xvfb; then
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y xvfb x11vnc fluxbox websockify wget unzip
fi

if ! test -d /noVNC; then
    git clone --depth 1 https://github.com/novnc/noVNC.git /noVNC
fi

pm2 delete xvfb 2>&1 >/dev/null || true
pm2 start "bash $SCRIPT_DIR/xvfb_run.sh" --name xvfb

echo "" >&2
echo "================ Xvfb ================" >&2
echo "Run 'pm2 list' to list the processes." >&2
echo "Run 'pm2 logs xvfb --lines 1000' to see the logs." >&2
echo "Run 'pm2 delete xvfb' to delete the process." >&2
