# Scope is quick self contained transportable devel env - severe security issue presents!

FROM centos:centos7
MAINTAINER  levm "av@levm.eu"
#Install prereq
RUN yum install -y epel-release
RUN yum install -y git nginx
RUN mkdir /usr/share/nginx/html/lib
RUN git clone https://github.com/mbostock/d3.git /usr/share/nginx/html/lib

# Adapt config - to override the index at runtime with -v -v ./index.html:/usr/share/nginx/html/index.html:ro 
COPY index.html /usr/share/nginx/html/index.html
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

## HTTPS stun
# Download certificate and key from the customer portal https://cs.nginx.com
# and copy to the build context
#ADD nginx-repo.crt /etc/ssl/nginx/
#ADD nginx-repo.key /etc/ssl/nginx/
# Get other files required for installation
#RUN wget -q -O /etc/ssl/nginx/CA.crt https://cs.nginx.com/static/files/CA.crt

# forward request logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

#start nginx
CMD ["nginx", "-g", "daemon off;"]

#CMD ["/usr/sbin/nginx","-c", "/etc/nginx/nginx.conf"]
