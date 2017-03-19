FROM bwstitt/alpine:3.5

ENV PATH /pyenv/bin:$PATH
RUN docker-apk-install python3 \
 && mkdir /pyenv \
 && chown abc:abc /pyenv \
 && su-exec abc:abc pyvenv-3.5 /pyenv \
 && su-exec abc:abc pip install -U pip==9.0.1 setuptools==34.3.1

# TODO: put no-cache-dir into pip.conf
