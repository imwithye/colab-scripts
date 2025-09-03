#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/deps.sh

if ! checkinstall vncserver; then
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y dbus-x11 xfce4 xfce4-terminal
    rm -f /tmp/libssl1.1.deb
    wget -q -O /tmp/libssl1.1.deb http://ftp.de.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y /tmp/libssl1.1.deb
    rm -f /tmp/kasm.deb
    wget -q -O /tmp/kasm.deb https://github.com/kasmtech/KasmVNC/releases/download/v1.3.4/kasmvncserver_bullseye_1.3.4_amd64.deb
    DEBIAN_FRONTEND=noninteractive apt-get install -qq -y /tmp/kasm.deb
fi

echo "Run 'vncserver' to start the VNC server." >&2
echo "Run 'pm2 start --name kasmvnc \"cloudflared tunnel --url \$VNC_URL --no-tls-verify\"' to access the VNC server." >&2
