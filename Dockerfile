FROM node:12-alpine
WORKDIR /app

Run npm install -g yapi-cli

EXPOSE 3002 9090

ENTRYPOINT [ "yapi", "server" ]
