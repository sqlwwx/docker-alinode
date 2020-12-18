# docker-alinode
![Docker](https://github.com/sqlwwx/docker-alinode/workflows/Docker/badge.svg)

https://cr.console.aliyun.com/images/cn-hangzhou/aliyun-node/alinode/detail

# images
```
sqlwwx/alinode
sqlwwx/alinode-git
sqlwwx/alinode-builder
```

# clean
```
find /var/ -size +10
du --max-depth=1 .
find /usr/lib/node_modules/ -name *.md | xargs rm
rm -rf /var/cache/apk/*
```
