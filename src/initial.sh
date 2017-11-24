#!/bin/sh
chmod +x /opt/geth-shell/*.sh

geth account new \
--datadir "/data/ethereum" \
--password /opt/geth-shell/password \
/opt/genesis.json

geth --datadir "/data/ethereum" \
--ethash.dagdir "/data/ethash" \
init \
/opt/geth-shell/genesis.json
