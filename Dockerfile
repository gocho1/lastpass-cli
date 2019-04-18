FROM alpine:3.9

MAINTAINER Guillaume Lhermenier "guillaume.lhermenier@gmail.com"

ARG user=lpass
ARG group=lpass
ARG uid=1000
ARG gid=1000

RUN addgroup -g ${gid} ${group} && \
    adduser -h "/home/${user}" -u ${uid} -G ${group} -s /bin/bash -D ${user}

RUN apk add --no-cache --update openssl openssl-dev libcurl libxml2 libssh-dev libressl-dev curl-dev pinentry xclip git make cmake g++

RUN git clone https://github.com/lastpass/lastpass-cli && \
    cd /lastpass-cli && \
    make

USER root

RUN cp /lastpass-cli/build/lpass /usr/bin/lpass && \
    chmod 755 /usr/bin/lpass && \
    rm -rf /lastpass-cli && \
    apk del curl-dev pinentry xclip git make cmake g++

USER ${user}
ENTRYPOINT ["lpass"]
