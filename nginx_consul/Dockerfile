FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release tar ; yum clean all
RUN yum -y install nginx ; yum clean all
#RUN yum -y install runit

ADD consul-template /bin/consul-template
 
RUN mkdir -p /etc/service/nginx && mkdir -p /etc/service/consul-template && rm /etc/nginx/nginx.conf
ADD consul-template.service /etc/service/consul-template/run
ADD conf.d/template-hotglue.levm.eu.conf /etc/consul-templates/nginx.conf
ADD nginx.service /etc/service/nginx/run
ADD nginx.conf.org /etc/nginx/nginx.conf
RUN chmod 777 -R /etc/consul-templates/nginx.conf
RUN chmod 777 -R /etc/service/nginx

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

 
EXPOSE 80

CMD [ "/usr/sbin/nginx" ]


#CMD ["/usr/bin/runsvdir", "/etc/service"]
