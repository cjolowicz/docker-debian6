#
# Docker Image for Python 3.6.8 on Debian 6 (squeeze)
#

FROM cjolowicz/curl-debian6:7.64.0

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libffi-dev \
        libsqlite3-dev \
        make \
        tk-dev \
        uuid-dev \
        autoconf \
        automake \
        bzip2 \
        bzr \
        ca-certificates \
        dirmngr \
        dpkg-dev \
        file \
        g++ \
        git \
        gnupg \
        imagemagick \
        libbz2-dev \
        libc6-dev \
        libcurl4-openssl-dev \
        libdb-dev \
        libevent-dev \
        libgdbm-dev \
        libgeoip-dev \
        libglib2.0-dev \
        libjpeg-dev \
        libkrb5-dev \
        liblzma-dev \
        libmagickcore-dev \
        libmagickwand-dev \
        libmysqlclient-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libpng-dev \
        libpq-dev \
        libreadline-dev \
        libssl-dev \
        libtool \
        libxml2-dev \
        libxslt-dev \
        libyaml-dev \
        mercurial \
        netbase \
        openssh-client \
        patch \
        pkg-config \
        procps \
        subversion \
        unzip \
        wget \
        xz-utils \
        zlib1g-dev \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV PYTHON_VERSION 3.6.8

# https://stackoverflow.com/questions/5937337/building-python-with-ssl-support-in-non-standard-location
COPY use-local-openssl.patch /usr/local/src

RUN set -ex; \
    cd /usr/local/src; \
    curl https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -LO; \
    tar -xf Python-$PYTHON_VERSION.tgz; \
    rm -f Python-$PYTHON_VERSION.tgz; \
    cd Python-$PYTHON_VERSION; \
    patch -p1 < ../use-local-openssl.patch; \
    ./configure \
        --enable-loadable-sqlite-extensions \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --without-ensurepip \
        CPPFLAGS="$(pkg-config --cflags openssl) -Wl,-R/usr/local/ssl/lib" \
        LDFLAGS="$(pkg-config --libs openssl) -Wl,-R/usr/local/ssl/lib" \
    ; \
    make -j "$(nproc)"; \
    make install; \
    ldconfig; \
    find /usr/local -depth \
        \( \
            \( -type d -a \( -name test -o -name tests \) \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
        \) -exec rm -rf '{}' + \
    ; \
    cd .. ; \
    rm -rf Python-$PYTHON_VERSION; \
    python3 --version

# make some useful symlinks that are expected to exist
RUN set -ex; \
    cd /usr/local/bin; \
    ln -s idle3 idle; \
    ln -s pydoc3 pydoc; \
    ln -s python3 python; \
    ln -s python3-config python-config

ENV PYTHON_PIP_VERSION 19.0.3

RUN set -ex; \
    cd /usr/local/src; \
    curl -LO 'https://bootstrap.pypa.io/get-pip.py'; \
    python get-pip.py \
        --disable-pip-version-check \
        --no-cache-dir \
        "pip==$PYTHON_PIP_VERSION" \
    ; \
    pip --version; \
    find /usr/local -depth \
        \( \
            \( -type d -a \( -name test -o -name tests \) \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
        \) -exec rm -rf '{}' + \
    ; \
    rm -f get-pip.py

ENTRYPOINT ["python3"]
