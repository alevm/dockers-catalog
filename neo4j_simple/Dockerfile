FROM centos
MAINTAINER av@levm.eu

RUN yum install -y java-1.7.0-openjdk
# install supervisord
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum --enablerepo=epel install -y supervisor
RUN mv -f /etc/supervisord.conf /etc/supervisord.conf.org
ADD supervisord.conf /etc/

# prepare net
EXPOSE 7474

# setup NEO4j
RUN mkdir -p /srv/neo4j 
ADD neo4j /srv
# to gather directly from online most recent one and untar it
#RUN tar xvzf /srv/artifact.php?name=neo4j-community-2.2.1-unix.tar.gz -C /srv/neo4j --strip-components 1

CMD ["/usr/bin/supervisord"]


