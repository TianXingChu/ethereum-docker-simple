docker run^
 -it^
 --rm^
 -v E:/data:/data^
 chutianxing/ethereum-docker-simple account new^
 --datadir "/data/ethereum"^
 --password /opt/password^
 /opt/genesis.json

docker run^
 -it^
 --rm^
 -v E:/data:/data^
 chutianxing/ethereum-docker-simple^
 --datadir "/data/ethereum"^
 init^
 /opt/genesis.json
