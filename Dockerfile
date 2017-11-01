FROM alpine:3.5

MAINTAINER Cai Cooper "caicooper82@gmail.com"

ARG user=lpass
ARG group=lpass
ARG uid=1000
ARG gid=1000

RUN addgroup -g ${gid} ${group} && \
    adduser -h "/home/${user}" -u ${uid} -G ${group} -s /bin/bash -D ${user}

RUN apk add --no-cache --update openssl libcurl libxml2 libssh-dev libressl-dev libxml2-dev curl-dev pinentry xclip git make cmake g++

USER ${user}
WORKDIR /home/${user}

RUN git clone https://github.com/lastpass/lastpass-cli && \
    cd lastpass-cli && \
    make

USER root

RUN ln -s /home/${user}/lastpass-cli/build/lpass /usr/bin/lpass && \
    apk del curl-dev pinentry xclip git make cmake g++

USER ${user}
ENTRYPOINT ["lpass"]
