define(`BASE_IMAGE', `cjolowicz/curl-debian6:7.64.0')
define(`CONFIGURE_COMMAND',
       `./configure \
        --with-openssl=$OPENSSL_DIR \
        --with-curl=/usr/local')
include(`main.m4')
