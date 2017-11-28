# ethereum-docker-simple

Read this in other languages: [简体中文](README.md), [English](README.en-US.md)

这个镜像以"ethereum/client-go"为基础, 并为方便搭建私链网络进行了一些简单的调整. 它发布于Docker Hub的"chutianxing/ethereum-docker-simple"上. 几天前, ethereum官方发布了最新的client-go镜像, 最新版本以alpine为基础的, 老版本以ubuntu为基础, 这导致很多以go-client为基础的镜像无法正常工作, 所以我创建了这个项目, 理论上只要ethereum不做大的调整, 这个镜像应该一直可以完美的运行. 在Windows,Linux和MacOs上安装和运行脚本都已经过测试, 可以完美运行.

## 前置条件

### 安装git
请参考[git](https://git-scm.com/)官网上的安装步骤.

### 安装docker
请参考[docker](https://www.docker.com/)官网上的安装步骤.

### 检查安装是否成功
```sh
C:\Users\chuti> git --version
git version 2.14.1.windows.1
C:\Users\chuti> docker --version
Docker version 17.09.0-ce, build afdb6d4
```
如果在命令行窗口你看到了类似上面的反应, 说明安装是成功的, 现在我们就可以正式开始运行ethereum的docker镜像了.

## 首先从GitHub上拉取最新的项目代码
打开命令行窗口, 创建一个新的文件夹, 在这个文件夹中运行指令, 在我们的实例中, 文件夹为/use/local/test/GitHub.
```sh
[chutianxing@myaliyun GitHub]$ git clone https://github.com/TianXingChu/ethereum-docker-simple.git
```
然后你会看到下面的反应.
```sh
Cloning into 'ethereum-docker-simple'...
remote: Counting objects: 115, done.
remote: Compressing objects: 100% (73/73), done.
remote: Total 115 (delta 54), reused 98 (delta 37), pack-reused 0
Receiving objects: 100% (115/115), 13.18 KiB | 0 bytes/s, done.
Resolving deltas: 100% (54/54), done.
```

## 接下来运行初始化脚本
有两种ethereum节点, bootnode和非bootnode. 事实上, 这两种节点从功能上看完全相同, 只是bootnode部署在服务器端, 有固定的ip和nodekey, 方便非bootnode以一个固定的访问方式去与它创建连接. 而非bootnode可以以一个随机的nodekey去与其他节点创建连接, 当然, 非bootnode最好拥有一个固定的钱包私钥, 这样才能挖到以太币方便进行开发测试. 所以在一个私链网络中, 通常含有一个bootnode和多个非bootnode.

在我们的服务器上, 已经部署了一个bootnode, 所以如果没有其他特殊原因, 可以直接初始化为非bootnode.

### 初始化为非bootnode
Linux
```sh
chutianxing@chutianxing-HP:~/develop/GitHub/ethereum-docker-simple$ sudo sh posix/initial.sh
```
Windows
```sh
C:\Develop\GitHub\ethereum-docker-simple>windows\initial.bat
```
MacOs
```sh
ChuTianXings-Macbook-Air:ethereum-docker-simple chutianxing$ sh posix/initial.sh
```
如果看到类似下面的反应, 表示脚本运行成功.
```sh
Error response from daemon: get ethereum: no such volume
Unable to find image 'chutianxing/ethereum-docker-simple:latest' locally
latest: Pulling from chutianxing/ethereum-docker-simple
b56ae66c2937: Pull complete
e9f8c5ff1317: Pull complete
b9a23af0ff14: Pull complete
21c90418a426: Pull complete
Digest: sha256:7207e587ed91be3bf787023bbf4c50335440a0eb5f2fd5e18244bbc409c727c8
Status: Downloaded newer image for chutianxing/ethereum-docker-simple:latest
Address: {a0252c86838aef88ec648886dee55651c204d7f7}
INFO [11-27|23:26:28] Allocated cache and file handles         database=/data/ethereum/geth/chaindata cache=16 handles=16
INFO [11-27|23:26:28] Writing custom genesis block
INFO [11-27|23:26:28] Successfully wrote genesis state         database=chaindata                     hash=ca4e20…ec0824
INFO [11-27|23:26:28] Allocated cache and file handles         database=/data/ethereum/geth/lightchaindata cache=16 handles=16
INFO [11-27|23:26:28] Writing custom genesis block
INFO [11-27|23:26:28] Successfully wrote genesis state         database=lightchaindata                     hash=ca4e20…ec0824
using **NEW** nodekey
0c77ad52ecf576b50fd9ceefbffa9979a357dc75bba52c20e6490cacb0379694
```


### 初始化为bootnode
除非你想自己重新搭建一套独立于我们测试链的环境, 才需要执行这个步骤.--不推荐
Linux
```sh
chutianxing@chutianxing-HP:~/develop/GitHub/ethereum-docker-simple$ sudo sh posix/initial.sh bootnode
```
Windows
```sh
C:\Develop\GitHub\ethereum-docker-simple>windows\initial.bat bootnode
```
MacOs
```sh
ChuTianXings-Macbook-Air:ethereum-docker-simple chutianxing$ sh posix/initial.sh bootnode
```

如果看到类似下面的反应, 表示脚本运行成功.
```sh
Error response from daemon: get ethereum: no such volume
Unable to find image 'chutianxing/ethereum-docker-simple:latest' locally
latest: Pulling from chutianxing/ethereum-docker-simple
b56ae66c2937: Pull complete
e9f8c5ff1317: Pull complete
b9a23af0ff14: Pull complete
21c90418a426: Pull complete
Digest: sha256:7207e587ed91be3bf787023bbf4c50335440a0eb5f2fd5e18244bbc409c727c8
Status: Downloaded newer image for chutianxing/ethereum-docker-simple:latest
Address: {53e88292e2c0be1ba4f85ab786ab1fd90624a79c}
INFO [11-27|08:34:41] Allocated cache and file handles         database=/data/ethereum/geth/chaindata cache=16 handles=16
INFO [11-27|08:34:41] Writing custom genesis block
INFO [11-27|08:34:41] Successfully wrote genesis state         database=chaindata                     hash=ca4e20…ec0824
INFO [11-27|08:34:41] Allocated cache and file handles         database=/data/ethereum/geth/lightchaindata cache=16 handles=16
INFO [11-27|08:34:41] Writing custom genesis block
INFO [11-27|08:34:41] Successfully wrote genesis state         database=lightchaindata                     hash=ca4e20…ec0824
using **ORIGINAL** nodekey
```

## 然后就可以启动节点了
Linux
```sh
chutianxing@chutianxing-HP:~/develop/GitHub/ethereum-docker-simple$ sudo sh posix/startMiner.sh
```
Windows
```sh
C:\Develop\GitHub\ethereum-docker-simple>windows\startMiner.bat
```
MacOs
```sh
ChuTianXings-Macbook-Air:ethereum-docker-simple chutianxing$ sh posix/startMiner.sh
```
如果看到类似下面的反应, 表示节点已成功运行起来了, 并且当前已处于geth js console命令行模式.
```sh
your wallet address is
2d1d918b4a367770cccfc5824d1e5fc205510d6f
your nodekey is
3b315b2adf28e5a26206f4ae1bbc0f7e26eb1009ad5bfa2defb590078f9a124f
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.0-unstable-049797d4/linux-amd64/go1.9.2
coinbase: 0x2d1d918b4a367770cccfc5824d1e5fc205510d6f
at block: 0 (Thu, 01 Jan 1970 00:00:00 UTC)
 datadir: /data/ethereum
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

>
```

### 我们验证一下节点运行情况
输入"admin"
```sh
> admin
```
应该会返回类似下面的应答
```sh
{
  datadir: "/data/ethereum",
  nodeInfo: {
    enode: "enode://e7baa4ddda76ef344e0151eaf1da0c8872b10d699aeb210eb522bbae7c316dbfcf2c5caa89e72245172cb6512109d6ba2c4c04153e4028bd5038b9c69e28d672@[::]:30303",
    id: "e7baa4ddda76ef344e0151eaf1da0c8872b10d699aeb210eb522bbae7c316dbfcf2c5caa89e72245172cb6512109d6ba2c4c04153e4028bd5038b9c69e28d672",
    ip: "::",
    listenAddr: "[::]:30303",
    name: "Geth/v1.8.0-unstable-049797d4/linux-amd64/go1.9.2",
    ports: {
      discovery: 30303,
      listener: 30303
    },
    protocols: {
      eth: {
        difficulty: 404491092,
        genesis: "0xca4e206020b79db71563ee62fbfae9e1f4d60f49f1db3654a3c38e6078ec0824",
        head: "0x2b15cea40b0b6aee1e2e37bec3de2a0fb18ceef0786c19284cb93c210305f20e",
        network: 1
      }
    }
  },
  peers: [{
      caps: ["eth/62", "eth/63"],
      id: "f3ce7e40bfa87ebb3d740bf9e6f251aeba101f920ed50c30b4f91eaeeff65ba13d9766b7495f08b11e8aa5e2b9795309c13b0cedd7b5bcfbd1a2b47feac09b4e",
      name: "Geth/v1.8.0-unstable-049797d4/linux-amd64/go1.9.2",
      network: {
        localAddress: "172.17.0.2:49638",
        remoteAddress: "121.199.5.97:30303"
      },
      protocols: {
        eth: {...}
      }
  }],
  addPeer: function(),
  exportChain: function(),
  getDatadir: function(callback),
  getNodeInfo: function(callback),
  getPeers: function(callback),
  importChain: function(),
  removePeer: function(),
  sleep: function github.com/ethereum/go-ethereum/console.(*bridge).Sleep-fm(),
  sleepBlocks: function github.com/ethereum/go-ethereum/console.(*bridge).SleepBlocks-fm(),
  startRPC: function(),
  startWS: function(),
  stopRPC: function(),
  stopWS: function()
}
```

### 下面简单介绍下geth的几个常用命令
获取自己的钱包地址
```sh
> eth.accounts
["0x2d1d918b4a367770cccfc5824d1e5fc205510d6f"]
```
查看以太币余额
```sh
> web3.fromWei(eth.getBalance(eth.accounts[0]))
11587.65625
```
查询别人的以太币余额, 下面的这个地址就是部署在我们服务器上的bootnode的钱包地址.
```sh
> web3.fromWei(eth.getBalance("0x6db6af16f99d8f27e647bce8a4d3f2997f88f125"))
80
```
转账
```sh
> amount=web3.toWei(5,'ether')
"5000000000000000000"
> eth.sendTransaction({from:eth.accounts[0],to:"0x6db6af16f99d8f27e647bce8a4d3f2997f88f125",value:amount})
Error: authentication needed: password or unlock
    at web3.js:3143:20
    at web3.js:6347:15
    at web3.js:5081:36
    at <anonymous>:1:1
```
如初出现了上面的错误, 是因为你的钱包已经被锁定了, 这时需要输入密码对账户进行解锁. 可以输入下面的指令, 当出现"Passphrase"提示时, 输入"123456", 嗯, 这个密码是预置在创建钱包脚本中的, 所以我知道~ 返回"true"之后, 再重复上面的转账操作, 会返回交易的hash值. 我们可以通过这个hash值来查询转账交易的更多信息.
```sh
> personal.unlockAccount(eth.accounts[0])
Unlock account 0xa2b4dcd38c73d9cd2876599e7186c5de0476c482
Passphrase:
true
> eth.sendTransaction({from:eth.accounts[0],to:"0x6db6af16f99d8f27e647bce8a4d3f2997f88f125",value:amount})
"0x682376036938db3ab4cac5ea6040e3baba7704891a7937ebd949decaaad78808"
```
稍等片刻, 再查询下我们服务器上bootnode的钱包余额
```sh
> web3.fromWei(eth.getBalance("0x6db6af16f99d8f27e647bce8a4d3f2997f88f125"))
85
```
嗯, 转账成功了, 下面我们还可以查询下交易的具体信息
```sh
> eth.getTransaction("0x682376036938db3ab4cac5ea6040e3baba7704891a7937ebd949decaaad78808")
{0
  blockHash: "0x0d0a411e2216151ac8e2c763d36a3795311869b3a066a7c9bb8b47a10b6c7a81",
  blockNumber: 2671,
  from: "0xa2b4dcd38c73d9cd2876599e7186c5de0476c482",
  gas: 90000,
  gasPrice: 18000000000,
  hash: "0x682376036938db3ab4cac5ea6040e3baba7704891a7937ebd949decaaad78808",
  input: "0x",
  nonce: 0,
  r: "0xc5ee9fdc464ada99fe6c8dd6201ec89199eba1022b5670b5e40731c499bab682",
  s: "0xd751ca3a88747ea5d9ad41e69b464d0f8c575cfdeb761ee51db633132ec5e55",
  to: "0x6db6af16f99d8f27e647bce8a4d3f2997f88f125",
  transactionIndex: 0,
  v: "0x441",
  value: 5000000000000000000
}
```
上面返回交易被记录的区块索引号:2671, 区块哈希值(blockHash), 交易的发送方(from)和接收方(to), 交易金额(value), 交易发送方为本次交易提供的gas和gas价格(gasPrice), 以及本次交易在区块儿中的交易索引号(transactionIndex).

## QA
### 如何关闭节点
```sh
> exit
```

### 如何让节点在后台运行
直接关闭窗口就可以了, 以太坊节点会在后台继续运行的

### 如何确认节点在后台的运行情况
运行 docker ps -a就可以了, 在Linux,MacOs,Windows上面, 都是这个指令, 唯一可能有区别的就是权限问题, 如果在Linux或者MacOs上面遇到权限问题, 在命令行的开头添加sudo就可以了.
```sh
chutianxing@chutianxing-HP-Pavilion-dv6-Notebook-PC:~$ docker ps -a
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.32/containers/json?all=1: dial unix /var/run/docker.sock: connect: permission denied
chutianxing@chutianxing-HP-Pavilion-dv6-Notebook-PC:~$ sudo docker ps -a
[sudo] password for chutianxing:
CONTAINER ID        IMAGE                                COMMAND                  CREATED             STATUS              PORTS                                                                                                 NAMES
3318a674cfba        chutianxing/ethereum-docker-simple   "/bin/ash /opt/get..."   About an hour ago   Up About an hour    8545/tcp, 30301/udp, 30301/tcp, 127.0.0.1:8546->8546/tcp, 30303-30304/udp, 0.0.0.0:30303->30303/tcp   geth
```
如果出现上面 IMAGE名称为"chutianxing/ethereum-docker-simple"的记录, 并且STATUS为"Up ..."就说明节点在后台运行正常.

### 如何把在后台运行的节点调度到前台
```sh
chutianxing@chutianxing-HP-Pavilion-dv6-Notebook-PC:~$ docker attach geth
```

### 电脑重启后如何恢复节点工作
首先是启动docker, 在Windows和MacOs中都有图形化的界面可以启动docker, 在linux中docker会在电脑重启后自动启动(如果你没有动过什么配置的话). 在启动docker之后, 再次执行[然后就可以启动节点了](#然后就可以启动节点了)中的步骤.
