FROM node:18-alpine as builder
WORKDIR /yapi
#RUN apk add --no-cache wget python make
ENV VERSION=1.0
RUN wget https://github.com/KevinXie2021/weee_yapi/releases/tag/v${VERSION}.zip
RUN unzip v${VERSION}.zip && mv yapi-${VERSION} vendors
RUN cd /yapi/vendors && cp config_weee.json ../config.json && npm install --production --registry https://registry.npm.taobao.org

FROM node:18-alpine
MAINTAINER weee
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
EXPOSE 3005
ENTRYPOINT ["node"]
