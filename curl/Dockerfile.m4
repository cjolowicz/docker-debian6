define(
  CONFIGURE_COMMAND,
  `ifelse(
    ARCH, `x86_64',
    `LDFLAGS="-Wl,-R/usr/local/lib:$OPENSSL_DIR/lib" ./configure --with-ssl=$OPENSSL_DIR',
    ARCH, `i386',
    `LDFLAGS="-Wl,-R/usr/local/lib:$OPENSSL_DIR/lib" ./configure --with-ssl=$OPENSSL_DIR --host=i686-pc-linux-gnu CFLAGS=-m32')')dnl
include(main.m4)
