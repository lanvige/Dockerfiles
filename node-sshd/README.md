# node-sshd

The Docker with Node.js and SSH daemon service inside.

A container from Node.js with openssh-server preinstalled to be used as a base image.


## Installation

``` bash
$ git clone https://github.com/lanvige/node-sshd.git
$ cd rails-sshd
$ docker build -t="lanvige/node-sshd" .
```


## Usage

#### Run the container

```
$ docker run -d -P --name node_sshd lanvige/node-sshd
$ docker port node_sshd 22

# 0.0.0.0:32768
```

#### Connect to server

```
$ ssh root@192.168.1.2 -p 32768
# The password is ``password01!``.
$$
```


## What after?

You can create new images starting your Dockerfile with something like

```
FROM lanvige/node-sshd
```

and modify appropriately the ```supervisord.conf``` file without overwriting the previous one. For example, in your derivated images, you 
could use the following approach appending a new file:

```bash
$ ADD ./supervisord.conf.append /etc/supervisord.conf.append
$ RUN cat /etc/supervisord.conf.append >> /etc/supervisord.conf &&\
      rm /etc/supervisord.conf.append
```

There is an example at [docker-wpngx](https://github.com/sullof/docker-wpngx).



REF::
---
- [Dockerizing an SSH daemon service](https://docs.docker.com/examples/running_ssh_service/)