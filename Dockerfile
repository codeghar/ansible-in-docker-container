FROM alpine:3.6

LABEL maintainer "https://github.com/aikchar/ansible-in-docker-container"

RUN apk update && \
    apk add \
            python3=3.6.1-r3 \
            ca-certificates &&\
    apk add --virtual=build \
            gcc \
            libffi-dev \
            make \
            musl-dev \
            openssh-client \
            openssl-dev \
            python3-dev=3.6.1-r3 &&\
    python3 -m venv /usr/local/share/ansible-virtualenv && \
    /usr/local/share/ansible-virtualenv/bin/pip install ansible==2.4.1.0 && \
    apk del --purge build &&\
    mkdir -p /srv/ansible && \
    mkdir -p /root/.ssh

WORKDIR /srv/ansible

ENV PATH=/usr/local/share/ansible-virtualenv/bin:$PATH

VOLUME [ "/srv/ansible" ]
