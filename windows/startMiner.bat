docker run^
 -it^
 --rm^
 --name geth^
 -p 30303:30303^
 -p 8545:8545^
 -p 8546:8546^
 -v ethereum:/data^
 chutianxing/ethereum-docker-simple^
 /opt/geth-shell/startMiner.sh
