FROM python:alpine3.6

LABEL maintainer "Hamza Sheikh <code@codeghar.com>"

RUN apk update && \
    apk add gcc && \
    apk add python3-dev && \
    apk add musl-dev && \
    apk add libffi-dev && \
    apk add openssl-dev && \
    apk add make && \
    apk add openssh-client && \
    python3 -m pip install virtualenv && \
    python3 -m virtualenv /usr/local/share/ansible-virtualenv && \
    /usr/local/share/ansible-virtualenv/bin/pip install ansible && \
    apk del gcc && \
    apk del python3-dev && \
    apk del musl-dev && \
    apk del libffi-dev && \
    apk del openssl-dev && \
    mkdir -p /srv/ansible

WORKDIR /srv/ansible

ENV PATH=/usr/local/share/ansible-virtualenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME [ "/srv/ansible" ]
