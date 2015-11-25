#FROM nginx:latest
MAINTAINER  levm "av@levm.eu"

FROM    centos:centos7
RUN yum -y update
RUN yum -y install epel-release tar
RUN yum -y install nginx nmap telnet tar net-tools unzip bind-utils curl


ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
ENV CONSUL_DOMAIN basic
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /bin/start.sh
#RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://github.com/hashicorp/consul-template/releases/download/v0.11.1/consul_template_0.11.1_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul_template_0.11.1_linux_amd64.zip -d /usr/bin
