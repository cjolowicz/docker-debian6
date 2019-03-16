#
# Docker Image for OpenSSL 1.1.1b on Debian 6 (squeeze)
#

FROM BASE_IMAGE

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        curl \
        gcc \
        make \
        libc6-dev \
        patch \
        perl \
        zlib1g-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV OPENSSL_VERSION 1.1.1b
ENV OPENSSL_DIR /usr/local/ssl

RUN set -ex; \
    cd /usr/local/src; \
    curl https://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz -LO; \
    tar -xf openssl-$OPENSSL_VERSION.tar.gz; \
    rm -f openssl-$OPENSSL_VERSION.tar.gz; \
    cd openssl-$OPENSSL_VERSION; \
    CONFIGURE_COMMAND; \
    make -j "$(nproc)"; \
    make install; \
    cd .. ; \
    rm -rf openssl-$OPENSSL_VERSION; \
    echo $OPENSSL_DIR/lib > /etc/ld.so.conf.d/openssl-$OPENSSL_VERSION.conf; \
    ldconfig -v; \
    $OPENSSL_DIR/bin/openssl version -a

ENV PATH $OPENSSL_DIR/bin:$PATH
ENV PKG_CONFIG_PATH $OPENSSL_DIR/lib/pkgconfig

ENTRYPOINT ["openssl"]