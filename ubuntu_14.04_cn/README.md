ubuntu_14.04_cn
===============

将官方的Ubuntu 14.04 替换成中国源，并完成更新，然后作为基础Image。

- Replace sources.list with CN
- Upgrade system & update
- Install software-properties-common
- Install build-essential
- Install curl & wget

### Build it
``` bash
$ sudo docker build -t lanvige/ubuntu .
```

### Tag it

```
$ sudo docker tag <Image ID> ubuntu:cnsources
```


Then use it as ubuntu basic image.