FROM alpine:3.6

LABEL maintainer "https://github.com/aikchar/ansible-in-docker-container"

# pip installation inspired by https://github.com/docker-library/python/blob/master/3.6/alpine3.6/Dockerfile
RUN apk update && \
    apk add \
            ca-certificates \
            python3=3.6.1-r3 &&\
    ln -s /usr/bin/python3 /usr/bin/python &&\
    set -ex; \
	apk add --no-cache --virtual .fetch-deps libressl; \
	\
	wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py'; \
	\
	apk del .fetch-deps; \
	\
	python3 get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==9.0.1" \
	; \
    ln -s /usr/bin/pip3 /usr/bin/pip &&\
	pip --version; \
	\
	find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +; \
	rm -f get-pip.py &&\
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
