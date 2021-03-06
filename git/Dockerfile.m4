#
# Docker Image for Git 2.21.0 on Debian 6 (squeeze)
#

FROM REPO/curl-debian6-ARCH:7.64.0

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        gettext \
        libexpat1-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV GIT_VERSION 2.21.0

RUN set -ex; \
    cd /usr/local/src; \
    curl https://mirrors.edge.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz -LO; \
    tar -xf git-$GIT_VERSION.tar.gz; \
    rm -f git-$GIT_VERSION.tar.gz; \
    cd git-$GIT_VERSION; \
    ./configure \
        --with-openssl=$OPENSSL_DIR \
        --with-curl=/usr/local \
    ; \
    make -j "$(nproc)"; \
    make install; \
    cd ..; \
    rm -rf git-$GIT_VERSION; \
    git --version
