# Ethereum playground for private networks
#
FROM ethereum/client-go

LABEL maintainer="chutianxing@gmail.com"

EXPOSE 8545 8546 30301 30301/udp 30303 30303/udp 30304/udp

ADD src/* /opt/
