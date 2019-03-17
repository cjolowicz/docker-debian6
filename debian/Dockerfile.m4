define(
  BASE_IMAGE,
  `ifelse(
    ARCH, `x86_64',
    `debian/eol:squeeze',
    ARCH, `i386',
    `lpenz/debian-squeeze-i386')')dnl
#
# Docker Image for Debian 6 Squeeze
#

FROM BASE_IMAGE

# allow unauthenticated packages (keys are invalid now)
# https://askubuntu.com/a/74389/469295
RUN echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/10-allow-unauthenticated
