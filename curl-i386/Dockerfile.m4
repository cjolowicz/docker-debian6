define(`BASE_IMAGE', `cjolowicz/openssl-debian6-i386:1.1.1b')
define(`CONFIGURE_COMMAND',
       `LDFLAGS="-Wl,-R/usr/local/lib:$OPENSSL_DIR/lib" ./configure --with-ssl=$OPENSSL_DIR --host=i686-pc-linux-gnu CFLAGS=-m32')
include(`../curl/main.m4')
