# Docker image for running an elastic search instance

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV KEY 'https://packages.elastic.co/GPG-KEY-elasticsearch'

ADD elasticsearch.repo /etc/yum/repos.d/elasticsearch.repo

RUN rpm --import $KEY \
    && yum install -y elasticsearch java-headless \
    && yum clean all

RUN mkdir -p /etc/service/elasticsearch
ADD elasticsearch.run /etc/service/elasticsearch/run
RUN chmod -R a+x /etc/service/elasticsearch

EXPOSE 9200

ENTRYPOINT [ "/etc/service/elasticsearch/run" ]
