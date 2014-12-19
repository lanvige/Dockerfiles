Rails Project for Docker
============


```
$ sudo docker build -t lanvige/rails:app .
```

```
$ sudo docker run -d -p 8080:8080 lanvige/rails:app
```

```
$ sudo docker run -t -i -p 8080:8080 lanvige/rails:app /bin/bash
```
REF::
---
https://github.com/seapy/dockerfiles/tree/master/rails-nginx-unicorn-pro

