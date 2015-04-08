# Docker image for running an elastic search instance

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV PKG https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.5.0.tar.gz

RUN yum install -y tar java

RUN mkdir /elasticsearch
RUN curl -sSL $PKG | tar -xz  -C /elasticsearch --strip-components=1

EXPOSE 9200

ENTRYPOINT [ "/elasticsearch/bin/elasticsearch" ]
