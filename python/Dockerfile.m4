define(`BASE_IMAGE', `cjolowicz/curl-debian6:7.64.0')
define(`CONFIGURE_COMMAND',
       `./configure \
        --enable-loadable-sqlite-extensions \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --without-ensurepip \
        CPPFLAGS="$(pkg-config --cflags openssl) -Wl,-R/usr/local/ssl/lib" \
        LDFLAGS="$(pkg-config --libs openssl) -Wl,-R/usr/local/ssl/lib"')
include(`main.m4')
