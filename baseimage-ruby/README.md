baseimage-ruby
============

https://github.com/phusion/baseimage-docker

## How to use

``` bash
$ git clone https://github.com/lanvige/Dockerfiles.git
$ cd Dockerfiles/ruby
$ sudo docker build -t="lanvige/ruby:2.2" .
```

```
$ sudo docker run -it --name ruby_test lanvige/ruby:2.2
```


## buildpack

```
$ sudo docker build -t="lanvige/ruby:buildpack" .
```



```
$ sudo docker run -it --name ruby_buildpack_test lanvige/ruby:buildpack
```


## REF::

nodejs 
https://github.com/nodesource/distributions