# Base ubuntu docker image with build tools and a non-root (sudo) user.

FROM       ubuntu:latest
MAINTAINER Chris Corbyn <chris@w3style.co.uk>

RUN apt-get update -qq -y
RUN apt-get install -qq -y \
    sudo                   \
    git                    \
    curl                   \
    build-essential        \
    autoconf               \
    man                    \
    libreadline-dev        \
    libssl-dev             \
    libxml2-dev            \
    libxslt-dev            \
    zlib1g-dev             \
    libbz2-dev

RUN useradd -m -s /bin/bash default
RUN chgrp -R default /usr/local
RUN find /usr/local -type d | xargs chmod g+w

RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default
RUN chmod 0440 /etc/sudoers.d/default

ENV     HOME /home/default
WORKDIR /home/default
USER    default
