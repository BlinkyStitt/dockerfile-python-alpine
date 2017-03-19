FROM python:3.6-alpine

# linuxserver.io's images default to having abc user with gid/uid 911
RUN addgroup -g 911 abc \
 && adduser -G abc -D -u 911 abc

ADD docker-apk-install.sh /usr/local/sbin/docker-apk-install
RUN docker-apk-install su-exec

ADD pip.conf /etc/

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown abc:abc /pyenv \
 && su-exec abc python3.6 -m venv /pyenv
