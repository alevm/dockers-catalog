MAINTAINER  levm "av@levm.eu"

FROM centos:centos6
MAINTAINER av@levm.eu
RUN yum install -y java-1.6.0-openjdk
COPY projectlibre-1.6.1-1.rpm /opt/
RUN yum install -y /opt/projectlibre-1.6.1-1.rpm
RUN yum install -y liberation-sans-fonts.noarch

CMD ["projectlibre"]

