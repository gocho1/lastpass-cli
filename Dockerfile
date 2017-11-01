FROM alpine:3.5

MAINTAINER Cai Cooper "caicooper82@gmail.com"

RUN apk add --no-cache --update openssl libcurl libxml2 libssh-dev libressl-dev libxml2-dev curl-dev pinentry xclip git make cmake g++ && \
    git clone https://github.com/lastpass/lastpass-cli && \
    cd lastpass-cli && \
    make && \
    ln -s /lastpass-cli/build/lpass /usr/bin/lpass && \
    apk del curl-dev pinentry xclip git make cmake g++
ENTRYPOINT ["lpass"]
