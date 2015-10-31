FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release tar ; yum clean all
RUN yum -y install python-pip python-pycurl;

RUN pip install shinken

ENTRYPOINT ["bash"]