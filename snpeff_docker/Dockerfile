FROM ubuntu:xenial
MAINTAINER Jace Webster <jace.webster@wustl.edu>

ENV SNPEFF_V 4_3t

RUN apt update && apt install -y \
  openjdk-8-jdk wget tabix unzip \
  && wget -q https://sourceforge.net/projects/snpeff/files/snpEff_v${SNPEFF_V}_core.zip/download \
  && unzip download && rm download \
  && apt remove -y wget && apt autoclean -y && apt autoremove -y
