#!/bin/sh
docker run \
 -d \
 --name geth \
 -p 30303:30303 \
 -p 127.0.0.1:8546:8546 \
 -v ethereum:/data \
 chutianxing/ethereum-docker-simple \
 /opt/geth-shell/startMiner.sh
