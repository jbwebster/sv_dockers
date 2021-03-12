FROM ubuntu:xenial
MAINTAINER Jace Webster <jace.webster@wustl.edu>

ENV manta_v 1.5.0

RUN apt-get update -qq && apt-get -y install \
  gcc \
  g++ \
  curl \
  make \
  python \
  sed \
  bzip2 \
  zlib1g-dev \
  ca-certificates \
  zlib1g
  
RUN curl -O -L https://github.com/Illumina/manta/releases/download/v$manta_v/manta-$manta_v.release_src.tar.bz2 \
  && tar -xjf manta-$manta_v.release_src.tar.bz2 \
  && rm -rf manta-$manta_v.release_src.tar.bz2 \
  && sed -i 's/MAX_QSCORE = 70,/MAX_QSCORE = 100,/g' manta-$manta_v.release_src/src/c++/lib/blt_util/qscore_cache.hh \
  && mkdir build \ 
  && cd build \
  && mkdir -p /usr/bin/manta \
  && ../manta-$manta_v.release_src/configure --jobs=4 --prefix=/usr/bin/manta \
  && make -j 4 install \
  && cd .. \
  && rm -rf build manta-$manta_v.release_src \
  && AUTO_ADDED_PACKAGES=`apt-mark showauto`
