#FROM nginx:latest

FROM    centos:centos7
RUN yum -y update
RUN yum -y install epel-release tar
RUN yum -y install nginx nmap telnet tar net-tools unzip dig curl


ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /bin/start.sh
#RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://github.com/hashicorp/consul-template/releases/download/v0.11.0/consul_template_0.11.0_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul_template_0.11.0_linux_amd64.zip -d /usr/bin
