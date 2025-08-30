#!/bin/bash

set -e

checkexist() {
    test -f $@.sh 2>&1 >/dev/null
}

cd /content

if ! test -d colab-scripts; then
    git clone --depth 1 https://github.com/imwithye/colab-scripts.git
fi

cd colab-scripts

if [ -z "$1" ]; then
    echo "Usage: bash -s -- <script>"
    exit 1
fi

if ! checkexist $1; then
    echo "Script $1 not found"
    exit 1
fi

source $1.sh
