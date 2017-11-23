#!/bin/sh
docker run \
 -it \
 -p 30303 \
 -v ethereum:/data \
 chutianxing/ethereum-docker-simple \
 --mine \
 --minerthreads=1 \
 --etherbase=0xb9e7ecf86009b7534ca9f05d867631ca391ea2cd \
 --networkid 1 \
 --bootnodes enode://f3ce7e40bfa87ebb3d740bf9e6f251aeba101f920ed50c30b4f91eaeeff65ba13d9766b7495f08b11e8aa5e2b9795309c13b0cedd7b5bcfbd1a2b47feac09b4e@121.199.5.97:30303 \
 --nodekey /opt/boot.key \
 --datadir "/data/ethereum" \
 --ethash.dagdir "/data/ethash"
