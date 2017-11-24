FROM alpine:3.6

LABEL maintainer "https://github.com/aikchar/ansible-in-docker-container"

RUN apk update && \
    apk add \
            ca-certificates \
            python3=3.6.1-r3 &&\
    ln -s /usr/bin/python3 /usr/bin/python &&\
    ln -s /usr/bin/pip3 /usr/bin/pip &&\
    apk add --virtual=build \
            gcc \
            libffi-dev \
            make \
            musl-dev \
            openssh-client \
            openssl-dev \
            python3-dev=3.6.1-r3 &&\
    pip install ansible==2.4.1.0 && \
    apk del --purge build &&\
    mkdir -p /srv/ansible && \
    mkdir -p /root/.ssh

WORKDIR /srv/ansible

VOLUME [ "/srv/ansible" ]
