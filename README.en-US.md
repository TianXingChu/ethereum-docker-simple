# ethereum-docker-simple

Read this in other languages: [English](README.en-US.md), [简体中文](README.md)

## English readme is NOT accomplished yet

This image is derived from "ethereum/client-go", but slightly modified to make it simpler to run a private Ethereum network. This image is published on Docker Hub as "chutianxing/ethereum-docker-simple". Few days ago, ethereum officially released a new version of client-go docker image, which based on alpine linux instead of ubuntu, so some  images base on old "ethereum/go-client" malfunctional, and here's the solution.

## Pre-requirements

### Install git
You can follow the instructions on [git](https://git-scm.com/) webpage.

### Install docker
Follow the instructions on [docker](https://www.docker.com/) webpage.

### Check the installation of git and docker
```sh
C:\Users\chuti> git --version
git version 2.14.1.windows.1
C:\Users\chuti> docker --version
Docker version 17.09.0-ce, build afdb6d4
```
If you see messages like the ones above, you are ready to begin your journey.

## First pull the code from GitHub
Create a clean folder, in this case: /use/local/test/GitHub.
```sh
[chutianxing@myaliyun GitHub]$ git clone https://github.com/TianXingChu/ethereum-docker-simple.git
Cloning into 'ethereum-docker-simple'...
remote: Counting objects: 115, done.
remote: Compressing objects: 100% (73/73), done.
remote: Total 115 (delta 54), reused 98 (delta 37), pack-reused 0
Receiving objects: 100% (115/115), 13.18 KiB | 0 bytes/s, done.
Resolving deltas: 100% (54/54), done.
```

## Then run the initial script
There's two kind of nodes: bootnodes and non-bootnodes. Actually there's no functional difference between them. The bootnodes were deployed on the server has a fixed ip and nodekey to make the non-bootnodes can communicated with. The non-bootnodes can run on a random nodekey and a fixed wallet private key. You can create a network with a bootnode and dozens of non-bootnodes.
