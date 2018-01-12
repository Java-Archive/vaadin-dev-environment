FROM alpine:latest
MAINTAINER sven.ruppert@gmail.com
RUN apk add --no-cache wget
RUN wget https://github.com/drone/drone-cli/releases/download/v0.8.1/drone_linux_amd64.tar.gz
RUN tar -xzf drone_linux_amd64.tar.gz
RUN install -t /usr/local/bin drone
ENTRYPOINT /bin/sh
