FROM centos:centos7
MAINTAINER levm "av@levm.eu"
RUN yum -y update
RUN yum -y install epel-release tar
RUN yum -y install nginx nmap telnet tar net-tools unzip bind-utils curl
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
ENV CONSUL_DOMAIN basic
ADD nginx.conf /etc/nginx/nginx.conf
#ADD start.sh /bin/start.sh
ADD https://releases.hashicorp.com/consul-template/0.12.0/consul-template_0.12.0_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.12.0_linux_amd64.zip -d /usr/bin
RUN rm -rf /usr/bin/consul-template_0.12.0_linux_amd64.zip
ENTRYPOINT ["/bin/start.sh"]
