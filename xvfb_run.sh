#!/bin/bash

set -e

trap "kill 0" EXIT

Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1
sleep 1

fluxbox &

x11vnc -display :1 -nopw -forever -shared -rfbport 5900 -ncache 10 &

/noVNC/utils/novnc_proxy --vnc localhost:5900 --listen 6080 &

wait
