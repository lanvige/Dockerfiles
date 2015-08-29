
https://github.com/phusion/baseimage-docker

## How to use

``` bash
$ git clone https://github.com/lanvige/Dockerfiles.git
$ cd Dockerfiles/rails
$ sudo docker build -t="lanvige/rails:2.2" .
```

```
$ sudo docker run -it --name ruby_test lanvige/rails:2.2
```


安装PG
http://www.postgresql.org/download/linux/ubuntu/