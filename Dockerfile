# Docker image for running an elastic search instance

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV PKG="https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.tar.gz"

RUN yum install -y tar java && yum clean all

RUN mkdir /elasticsearch
RUN curl -sSL $PKG | tar -xz  -C /elasticsearch --strip-components=1

EXPOSE 9200

ENTRYPOINT [ "/elasticsearch/bin/elasticsearch" ]
