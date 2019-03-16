define(`BASE_IMAGE', `cjolowicz/openssl-debian6:1.1.1b')
define(`CONFIGURE_COMMAND',
       `LDFLAGS="-Wl,-R/usr/local/lib:$OPENSSL_DIR/lib" ./configure --with-ssl=$OPENSSL_DIR')
include(`main.m4')
