define(`BASE_IMAGE', `cjolowicz/debian:squeeze')
define(`CONFIGURE_COMMAND',
       `./config --prefix=$OPENSSL_DIR --openssldir=$OPENSSL_DIR shared zlib enable-egd')
include(`openssl.m4')
