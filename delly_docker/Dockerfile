FROM ubuntu:18.04
MAINTAINER Jace Webster <jace.webster@wustl.edu>

ENV delly_v 0.8.1
ENV htslib_v 1.9

RUN apt-get update -y && apt-get install -y \
    libnss-sss \
    curl \
    less \
    vim  \
    wget \
    unzip \
    build-essential \
    libboost-all-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libnss-sss \
    libbz2-dev \
    liblzma-dev \
    bzip2 \
    libcurl4-openssl-dev

WORKDIR /usr/local/bin/
RUN curl -SL https://github.com/samtools/htslib/releases/download/${htslib_v}/htslib-${htslib_v}.tar.bz2 \
    > /usr/local/bin/htslib-${htslib_v}.tar.bz2
RUN tar -xjf /usr/local/bin/htslib-${htslib_v}.tar.bz2 -C /usr/local/bin/
RUN cd /usr/local/bin/htslib-${htslib_v}/ && ./configure
RUN cd /usr/local/bin/htslib-${htslib_v}/ && make
RUN cd /usr/local/bin/htslib-${htslib_v}/ && make install
ENV LD_LIBRARY_PATH /usr/local/bin/htslib-${htslib_v}/

WORKDIR /usr/local/bin
RUN wget https://github.com/dellytools/delly/archive/v${delly_v}.zip
RUN unzip v${delly_v}.zip
WORKDIR /usr/local/bin/delly-${delly_v}
RUN make all
WORKDIR /usr/local/bin
RUN ln -s /usr/local/bin/delly-0.8.1/src/delly /usr/local/bin/delly

CMD ["delly"]
