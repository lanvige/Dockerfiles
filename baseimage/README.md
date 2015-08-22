baseimage-docker
============

https://github.com/phusion/baseimage-docker

## How to use

``` bash
$ git clone https://github.com/lanvige/Dockerfiles.git
$ cd Dockerfiles/baseimage
$ sudo docker build -t="lanvige/baseimage" .
```

```
$ sudo docker run -d --name base lanvige/baseimage /sbin/my_init --enable-insecure-key
```

Get the container IP

```
sudo docker inspect nodejs1 | grep IPA
```

```
$ ssh -i insecure_key root@172.17.0.4
```


### 

上面方式是无法拿到一个外网 IP 的，所以需要对端口进行映射。

```
$ sudo docker run -d --name base --publish=10222:22 lanvige/baseimage /sbin/my_init --enable-insecure-key
```

```
$ ssh -i insecure_key root@<IP> -p 10222
```