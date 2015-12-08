#FROM nginx:latest

FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"
RUN yum update -y; yum clean all
RUN yum -y install epel-release
RUN yum -y install nginx unzip


ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
ENV CONSUL_DOMAIN basic
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /bin/start.sh

ADD https://github.com/hashicorp/consul-template/releases/download/v0.11.0/consul_template_0.11.0_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul_template_0.11.0_linux_amd64.zip -d /usr/bin
