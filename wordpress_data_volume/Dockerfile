FROM centos:centos7
MAINTAINER levm <av@levm.eu>
RUN yum install -y tar
ADD http://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz 
RUN mkdir -p /var/www/html
RUN mv /wordpress/* /var/www/html/
#RUN chown -R apache:apache /var/www/
ADD ./wp-config.php /var/www/html/wp-config.php
#RUN chown apache:apache /var/www/html/wp-config.php
VOLUME /var/www/html
CMD ["true"]

