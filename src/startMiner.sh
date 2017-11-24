#!/bin/sh
address=""
for file in `ls /data/ethereum/keystore`
do
  address=${file##*--}
done

if [$address || -z $address]
then
  echo "your wallet address is not exists"
  exit 1
fi

geth --mine \
--ws \
--minerthreads=1 \
--etherbase=$address \
--networkid 1 \
--bootnodes enode://f3ce7e40bfa87ebb3d740bf9e6f251aeba101f920ed50c30b4f91eaeeff65ba13d9766b7495f08b11e8aa5e2b9795309c13b0cedd7b5bcfbd1a2b47feac09b4e@121.199.5.97:30303 \
--nodekey /opt/boot.key \
--datadir "/data/ethereum" \
--ethash.dagdir "/data/ethash"
