#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/deps.sh

cd /content

if ! test -d /content/ComfyUI; then
    git clone --depth 1 https://github.com/comfyanonymous/ComfyUI.git /content/ComfyUI
    cd ComfyUI
    pip install -r requirements.txt
fi

mkdir -p $WORKSPACE_DIR/ComfyUI

mkdir -p $WORKSPACE_DIR/user
rm -rf /content/ComfyUI/user
ln -sf $WORKSPACE_DIR/user /content/ComfyUI/user

mkdir -p $WORKSPACE_DIR/input
rm -rf /content/ComfyUI/input
ln -sf $WORKSPACE_DIR/input /content/ComfyUI/input

mkdir -p $WORKSPACE_DIR/output
rm -rf /content/ComfyUI/output
ln -sf $WORKSPACE_DIR/output /content/ComfyUI/output

mkdir -p $WORKSPACE_DIR/models
rm -rf /content/ComfyUI/models
ln -sf $WORKSPACE_DIR/models /content/ComfyUI/models

cd /content/ComfyUI
pm2 start "python main.py --port 8188" --name comfyui
pm2 start "cloudflared tunnel --url http://localhost:8188" --name comfyui-tunnel --restart-delay=5000 --watch
