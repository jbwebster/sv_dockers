FROM ubuntu:xenial

MAINTAINER Jace Webster <jace.webster@wustl.ed>


RUN apt-get update \
    && apt-get install -y \
        build-essential \
        bzip2 \
        curl \
        zlib1g-dev \
        libncurses5-dev \
        python3.5

ENV SAMTOOLS_V 1.3.1

WORKDIR /root
RUN mkdir samtools \
    && curl -fsSL https://github.com/samtools/samtools/releases/download/$SAMTOOLS_V/samtools-$SAMTOOLS_V.tar.bz2 \
        | tar -jxC samtools --strip-components=1

WORKDIR /root/samtools
RUN ./configure \
    && make all all-htslib \
    && make install install-htslib


RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
WORKDIR /
COPY extractSplitReads_BwaMem /usr/local/bin/extractSplitReads_BwaMem
RUN chmod 755 /usr/local/bin/extractSplitReads_BwaMem

CMD ["samtools"]
