# rails-sshd

The Docker with rails and sshd inside

A container from Rails with openssh-server preinstalled to be used as a base image.
Inspired by [Dockerizing an SSH daemon service](https://docs.docker.com/examples/running_ssh_service/).


## Installation

```bash
$ git clone https://github.com/lanvige/rails-sshd.git
$ cd rails-sshd
$ sudo docker build -t="lanvige/rails-sshd" .
```

## Usage

Run the container

```
$ docker run -d -P --name app_name lanvige/rails-sshd
$ sudo docker port app_name 22

# 0.0.0.0:32768
```

```
$ ssh root@192.168.1.2 -p 32768
# The password is ``screencast``.
$$
```

## What after?

You can create new images starting your Dockerfile with something like
```
FROM sullof/sshd
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
- https://hub.docker.com/r/whatwewant/docker-of-ubuntu/


## License 

(The MIT License)

Copyright (c) 2015 Lanvige Jiang <lanvige@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
