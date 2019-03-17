[![Build Status](https://travis-ci.com/cjolowicz/docker-debian6.svg?branch=master)](https://travis-ci.com/cjolowicz/docker-debian6)

# docker-debian6

This repository provides Docker images for Debian 6 (squeeze) with
selected tools built against OpenSSL 1.1.1b.

- [cjolowicz/openssl-debian6-x86_64:1.1.1b](https://hub.docker.com/r/cjolowicz/openssl-debian6-x86_64)
- [cjolowicz/openssl-debian6-i386:1.1.1b](https://hub.docker.com/r/cjolowicz/openssl-debian6-i386)
- [cjolowicz/curl-debian6-x86_64:7.64.0](https://hub.docker.com/r/cjolowicz/curl-debian6-x86_64)
- [cjolowicz/curl-debian6-i386:7.64.0](https://hub.docker.com/r/cjolowicz/curl-debian6-i386)
- [cjolowicz/git-debian6-x86_64:2.21.0](https://hub.docker.com/r/cjolowicz/git-debian6-x86_64)
- [cjolowicz/git-debian6-i386:2.21.0](https://hub.docker.com/r/cjolowicz/git-debian6-i386)
- [cjolowicz/python-debian6-x86_64:3.6.8](https://hub.docker.com/r/cjolowicz/python-debian6-x86_64)
- [cjolowicz/python-debian6-i386:3.6.8](https://hub.docker.com/r/cjolowicz/python-debian6-i386)

The Docker images derive from the following base images:

- [debian/eol:squeeze](https://hub.docker.com/r/debian/eol:squeeze)
- [lpenz/debian-squeeze-i386:latest](https://hub.docker.com/r/lpenz/debian-squeeze-i386)

## Background

Debian 6 (squeeze) reached end of life in February 2016. While the
release can still be obtained from archive.debian.org, its packages
lack support for TLS >= 1.2. Following the widespread enforcement of
this protocol, programs included in the release are often unable to
establish connections to the outside world.
