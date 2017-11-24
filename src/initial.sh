#!/bin/sh
chmod +x /opt/geth-shell/*.sh

geth account new \
--datadir /data/ethereum \
--password /opt/geth-shell/password \
/opt/genesis.json

geth --datadir /data/ethereum \
--ethash.dagdir /data/ethash \
init \
/opt/geth-shell/genesis.json

if [ "$1" == "bootnode" ]
then
  echo "using **ORIGINAL** nodekey"
  cp -f /opt/geth-shell/boot.key /data/ethereum/boot.key
else
  echo "using **NEW** nodekey"
  cat /dev/urandom | tr -cd 'a-f0-9' | head -c 64 > /data/ethereum/boot.key
  cat /data/ethereum/boot.key
  echo ""
fi
