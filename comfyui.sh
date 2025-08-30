#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/deps.sh

cd /content

if ! test -d /content/ComfyUI; then
    git clone --depth 1 https://github.com/comfyanonymous/ComfyUI.git /content/ComfyUI
    cd ComfyUI
    pip install -r requirements.txt
fi

USERDATA_DIR=$WORKSPACE_DIR/ComfyUI
mkdir -p $USERDATA_DIR
cd $USERDATA_DIR

mkdir -p $USERDATA_DIR/user
rm -rf /content/ComfyUI/user
ln -sf $USERDATA_DIR/user /content/ComfyUI/user

mkdir -p $USERDATA_DIR/input
rm -rf /content/ComfyUI/input
ln -sf $USERDATA_DIR/input /content/ComfyUI/input

mkdir -p $USERDATA_DIR/output
rm -rf /content/ComfyUI/output
ln -sf $USERDATA_DIR/output /content/ComfyUI/output

mkdir -p $USERDATA_DIR/models
rm -rf /content/ComfyUI/models
ln -sf $USERDATA_DIR/models /content/ComfyUI/models

cd /content/ComfyUI
pm2 delete comfyui 2>&1 >/dev/null || true
pm2 start "python main.py --port 8188" --name comfyui
