FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip cmake build-essential pkg-config && \
    apt-get install -y binutils libc6 libcurl3 libssl1.0.0 libxml2 lastpass-cli
