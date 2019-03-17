define(
  CONFIGURE_COMMAND,
  `ifelse(
    ARCH, `x86_64',
    `./config --prefix=$OPENSSL_DIR --openssldir=$OPENSSL_DIR shared zlib enable-egd',
    ARCH, `i386',
    `./Configure --prefix=$OPENSSL_DIR --openssldir=$OPENSSL_DIR shared zlib enable-egd -m32 linux-generic32')')dnl
include(`main.m4')
