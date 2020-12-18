FROM registry.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:v6.4.1-alpine as builder

RUN rm -rf /root/.npm/_cacache

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache \
     tzdata \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone

RUN npm config set registry https://registry.npm.taobao.org

RUN npm i -g npm \
  && npm i -g yarn \
  && rm -rf /tmp/* && rm -rf $HOME/.npm/_cacache

FROM alpine

COPY --from=builder / /

ENV NODE_ENV production

WORKDIR /app
