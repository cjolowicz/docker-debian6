define(
  BASE_IMAGE,
  `ifelse(
    ARCH, `x86_64',
    `debian/eol:squeeze',
    ARCH, `i386',
    `lpenz/debian-squeeze-i386')')dnl
include(main.m4)
