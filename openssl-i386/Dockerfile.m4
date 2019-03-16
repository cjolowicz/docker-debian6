define(`BASE_IMAGE', `cjolowicz/debian-i386:squeeze')
define(`CONFIGURE_COMMAND',
       `./Configure --prefix=$OPENSSL_DIR --openssldir=$OPENSSL_DIR shared zlib enable-egd -m32 linux-generic32')
include(`../openssl/main.m4')
