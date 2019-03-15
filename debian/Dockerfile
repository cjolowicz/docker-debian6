# Docker Image for Debian 6 Squeeze
# Copyright (c) 2019 Iuri Diniz
# https://github.com/iuridiniz/debian6-docker/blob/master/LICENSE

FROM debian:squeeze

ENV DEBIAN_FRONTEND noninteractive

# enable archive packages
RUN rm /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian squeeze main non-free" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian squeeze-lts main non-free" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security squeeze/updates main" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-backports squeeze-backports main contrib non-free" >> /etc/apt/sources.list

# work around "E: Release file expired"
# https://unix.stackexchange.com/questions/2544/how-to-work-around-release-file-expired-problem-on-a-local-mirror
RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/10-no-check-valid-until

# allow unauthenticated packages (keys are invalid now)
# https://askubuntu.com/a/74389/469295
RUN echo 'APT::Get::AllowUnauthenticated "true";' >> /etc/apt/apt.conf.d/10-allow-unauthenticated
