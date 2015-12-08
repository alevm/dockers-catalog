FROM nginx:latest
MAINTAINER  levm "av@levm.eu"
RUN apt-get update
RUN apt-get install unzip

#FROM    centos:centos7
#RUN yum update -y; yum clean all
#RUN yum -y install epel-release
#RUN yum update -y; yum clean all
#RUN yum -y install nginx unzip

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
ENV CONSUL_DOMAIN basic
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /bin/start.sh

ADD https://releases.hashicorp.com/consul-template/0.11.1/consul-template_0.11.1_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.11.1_linux_amd64.zip -d /usr/bin
