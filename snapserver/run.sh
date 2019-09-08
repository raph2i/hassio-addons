#!/bin/bash

CONFIG_PATH=/data/options.json

SNAPSERVER_OPTS=$(jq --raw-output ".snapserveropts" $CONFIG_PATH)

mkdir -p /share/snapfifo

echo "Start Snapserver..."
/usr/bin/snapserver ${SNAPSERVER_OPTS}
