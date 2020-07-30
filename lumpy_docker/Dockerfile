FROM ubuntu:xenial
MAINTAINER Jace Webster <jace.webster@wustl.edu>

ENV samblaster_v 0.1.24
ENV sambamba_v 0.6.9
ENV samtools_v 1.9
ENV lumpy_v 0.3.0

RUN apt-get update -y && apt-get install -y \
    build-essential \
    libnss-sss \
    curl \
    vim \
    less \
    wget \
    unzip \
    cmake \
    python \
    gawk \
    python-pip \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libnss-sss \
    libbz2-dev \
    liblzma-dev \
    bzip2 \
    libcurl4-openssl-dev \
    libssl-dev \
    git \
    autoconf \
    bsdmainutils

WORKDIR /usr/local/bin
RUN pip install numpy
RUN pip install pysam

WORKDIR /usr/local/bin
RUN wget https://github.com/GregoryFaust/samblaster/archive/v.${samblaster_v}.zip
RUN unzip v.${samblaster_v}.zip
WORKDIR /usr/local/bin/samblaster-v.${samblaster_v}
RUN make
RUN ln -s /usr/local/bin/samblaster-v.${samblaster_v}/samblaster /usr/local/bin/samblaster

WORKDIR /usr/local/bin
RUN wget https://github.com/biod/sambamba/releases/download/v${sambamba_v}/sambamba-${sambamba_v}-linux-static.gz
RUN gunzip sambamba-${sambamba_v}-linux-static.gz
RUN chmod a+x sambamba-${sambamba_v}-linux-static
RUN ln -s sambamba-${sambamba_v}-linux-static sambamba

WORKDIR /usr/local/bin/
RUN curl -SL https://github.com/samtools/samtools/releases/download/${samtools_v}/samtools-${samtools_v}.tar.bz2 \
    > /usr/local/bin/samtools-${samtools_v}.tar.bz2
RUN tar -xjf /usr/local/bin/samtools-${samtools_v}.tar.bz2 -C /usr/local/bin/
RUN cd /usr/local/bin/samtools-${samtools_v}/ && ./configure
RUN cd /usr/local/bin/samtools-${samtools_v}/ && make
RUN cd /usr/local/bin/samtools-${samtools_v}/ && make install

WORKDIR /usr/local/bin
RUN wget https://github.com/arq5x/lumpy-sv/releases/download/${lumpy_v}/lumpy-sv.tar.gz
RUN tar -xzvf lumpy-sv.tar.gz
WORKDIR /usr/local/bin/lumpy-sv
RUN make
RUN ln -s /usr/local/bin/lumpy-sv/bin/lumpy /usr/local/bin/lumpy
RUN ln -s /usr/local/bin/lumpy-sv/bin/lumpy_filter /usr/local/bin/lumpy_filter
RUN ln -s /usr/local/bin/lumpy-sv/bin/lumpyexpress /usr/local/bin/lumpyexpress
WORKDIR /usr/local/bin

WORKDIR /usr/local/bin
RUN cp /usr/local/bin/lumpy-sv/scripts/lumpyexpress.config /usr/local/bin/
RUN sed -i 's@LUMPY_HOME=~/@LUMPY_HOME=/usr/local/bin/@' lumpyexpress.config

CMD ["lumpy --help"]
