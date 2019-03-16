#
# Docker Image for curl 7.64.0 on Debian 6 (squeeze)
#

FROM BASE_IMAGE

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        file \
    ; \
    rm -rf /var/lib/apt/lists/*

ENV CURL_VERSION 7.64.0

RUN set -ex; \
    cd /usr/local/src; \
    curl -LO https://dl.uxnr.de/mirror/curl/curl-$CURL_VERSION.tar.gz; \
    apt-get purge -y curl libcurl3; \
    tar -xf curl-$CURL_VERSION.tar.gz; \
    rm -f curl-$CURL_VERSION.tar.gz; \
    cd curl-$CURL_VERSION; \
    CONFIGURE_COMMAND; \
    make -j "$(nproc)"; \
    make install; \
    cd ..; \
    rm -rf curl-$CURL_VERSION; \
    /usr/local/bin/curl --version

ENV PATH /usr/local/bin:$PATH
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

ENTRYPOINT ["curl"]
CMD ["--help"]
