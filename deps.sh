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

if ! checkinstall pm2; then
    npm install -g pm2
fi

if ! checkpipinstall lightning; then
    pip install lightning
fi

if ! checkpipinstall stable-baselines3; then
    pip install stable-baselines3
fi
