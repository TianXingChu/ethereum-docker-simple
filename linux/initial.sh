docker volume remove ethereum
docker volume create ethereum
docker run \
 -it \
 --rm \
 -v ethereum:/data \
 chutianxing/ethereum-docker-simple account new \
 --datadir "/data/ethereum" \
 --password /opt/password \
 /opt/genesis.json

docker run \
 -it \
 --rm \
 -v ethereum:/data \
 chutianxing/ethereum-docker-simple \
 --datadir "/data/ethereum" \
 --ethash.dagdir "/data/ethash" \
 init \
 /opt/genesis.json
