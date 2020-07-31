FROM ubuntu:xenial

MAINTAINER Jace Webster <jace.webster@wustl.ed>


RUN apt-get update \
    && apt-get install -y \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        python3.5

    
WORKDIR /
COPY aggregate_bedpe.sh /usr/bin/aggregate_bedpe.sh
COPY aggregate_healthy_bedpe.sh /usr/bin/aggregate_healthy_bedpe.sh
COPY modify_SURVIVOR.py /usr/bin/modify_SURVIVOR.py
COPY modify_vcf.py /usr/bin/modify_VCF.py

CMD ["/bin/bash"]
