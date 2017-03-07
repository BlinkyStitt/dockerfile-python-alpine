FROM bwstitt/alpine:3.4

RUN docker-apk-install python3

ENV PATH /pyenv/bin:$PATH
RUN mkdir /pyenv \
 && chown user:nobody /pyenv \
 && su-exec user:nobody pyvenv-3.5 /pyenv \
 && su-exec user:nobody pip install -U pip==9.0.1 setuptools==34.3.1
