FROM node:14-alpine as builder
WORKDIR /yapi
#RUN apk add --no-cache wget python make
ENV VERSION=1.0
RUN wget https://github.com/YMFE/yapi/archive/refs/tags/v1.10.0.zip
RUN ls
RUN unzip v1.10.0.zip && mv yapi-1.10.0 vendors
RUN cd /yapi/vendors && cp config_example.json ../config.json && rm package-lock.json && npm install --production --registry https://registry.npm.taobao.org

FROM node:14-alpine
MAINTAINER weee
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
EXPOSE 3005
ENTRYPOINT ["node"]
