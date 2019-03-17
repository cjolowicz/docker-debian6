define(
  CONFIGURE_COMMAND,
  `ifelse(
    ARCH, `x86_64',
    `./configure \
        --with-openssl=$OPENSSL_DIR \
        --with-curl=/usr/local',
    ARCH, `i386',
    `./configure \
        --with-openssl=$OPENSSL_DIR \
        --with-curl=/usr/local')')dnl
