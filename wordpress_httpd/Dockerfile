# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>
#
# Updated and adapted for my case: av@levm.eu
# wordpress install in separate docker data-only

FROM centos:centos7
MAINTAINER alevm <av@levm.eu>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install httpd php php-mysql php-gd pwgen supervisor bash-completion openssh-server psmisc tar; yum clean all
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start.sh /start.sh
RUN chown -R apache:apache /var/www/
RUN chmod 755 /etc/apache2/foreground.sh

EXPOSE 80

CMD ["/bin/bash", "/start.sh"]

