FROM ubuntu:20.04
MAINTAINER Lothar Rubusch <lotophagon@protonmail.com>
ENV DEBIAN_FRONTEND=noninteractive


################################################################################
## the USER is needed to make it available as --build-arg
## in case docker complains for a not set USER, perhaps you forgot to use --build-arg USER="${USER}"
ARG USER="${USER}"


################################################################################
## set up apt fully functional
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y --purge
RUN apt-get install -y  \
        apt-utils

RUN apt-get install -y  \
        build-essential \
        libncurses5-dev \
        zlib1g-dev \
        gawk \
        wget \
        git-core \
        make \
        gcc \
        g++ \
        bison \
        flex \
        binutils \
        unzip \
        python \
        bzip2 \
        libssl-dev \
        locales \
        bc \
        cpio \
        rsync \
        cvs \
        mercurial \
        subversion \
        vim \
        screen \
        minicom \
        x11-apps \
        sudo


################################################################################
## locale settings
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8


################################################################################
## setup user and run stuff under user
RUN useradd "$USER" -m --password "$USER"
RUN usermod -a -G sudo "$USER"
RUN sed -i '/%sudo/s/.*/%sudo   ALL=NOPASSWD: ALL/' /etc/sudoers


################################################################################
## command mode
USER root

COPY build.sh /usr/local/bin/build.sh
CMD ["/bin/bash", "/usr/local/bin/build.sh"]
