#!/bin/bash

set -e

checkexist() {
    test -f $@.sh 2>&1 >/dev/null
}

if ! test -d colab-scripts; then
    git clone --depth 1 https://github.com/imwithye/colab-scripts.git /content/colab-scripts
fi

cd /content/colab-scripts

SCRIPT="deps"
if [ -n "$1" ]; then
    SCRIPT="$1"
fi

if ! checkexist $SCRIPT; then
    echo "Script $SCRIPT not found"
    exit 1
fi

bash $SCRIPT.sh >/dev/null
