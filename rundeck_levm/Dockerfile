# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release tar ; yum clean all
RUN yum install java-1.7.0 
RUN rpm -Uvh http://repo.rundeck.org/latest.rpm 
RUN yum install rundeck 
EXPOSE 4400
CMD ["service rundeckd start"]

