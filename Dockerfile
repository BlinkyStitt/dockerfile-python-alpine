FROM python:2.7-alpine

# linuxserver.io's images default to having abc user with gid/uid 911
RUN addgroup -g 911 abc \
 && adduser -G abc -D -u 911 abc

ADD docker-apk-install.sh /usr/local/sbin/docker-apk-install
RUN docker-apk-install su-exec

ADD pip.conf /etc/

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown abc:abc /pyenv \
 && pip install virtualenv==15.1.0 \
 && su-exec abc python2.7 -m virtualenv /pyenv
