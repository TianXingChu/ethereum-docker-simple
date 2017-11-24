docker volume remove ethereum
docker run^
 -it^
 --rm^
 -v ethereum:/data^
 chutianxing/ethereum-docker-simple^
 /opt/geth-shell/initial.sh
