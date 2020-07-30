FROM ubuntu:xenial
MAINTAINER Jace Webster <jace.webster@wustl.edu>


ENV survivor_install_dir /opt/SURVIVOR
ENV survivor_v 1.0.6.2

RUN apt-get update && apt-get install -y \
  g++ \
  make \
  gzip \
  wget \
  zlib1g-dev


WORKDIR /tmp
RUN wget https://github.com/apaul7/SURVIVOR/archive/v$survivor_v.tar.gz && \
  tar -zxf v$survivor_v.tar.gz

WORKDIR /tmp/SURVIVOR-$survivor_v/Debug
RUN make && \
  mkdir --parents $survivor_install_dir && \
  mv ./* $survivor_install_dir

WORKDIR /
RUN ln -s $survivor_install_dir/SURVIVOR /usr/bin/SURVIVOR && \
  rm -rf /tmp/SURVIVOR-$survivor_v/

COPY helper.sh /usr/bin/helper.sh
