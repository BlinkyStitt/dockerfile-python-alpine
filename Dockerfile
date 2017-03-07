FROM bwstitt/alpine:3.4

ENV PATH /pyenv/bin:$PATH
RUN docker-apk-install python3 \
 && mkdir /pyenv \
 && chown user:nobody /pyenv \
 && su-exec user:nobody pyvenv-3.5 /pyenv \
 && su-exec user:nobody pip install -U pip==9.0.1 setuptools==34.3.1

# TODO: put no-cache-dir into pip.conf
