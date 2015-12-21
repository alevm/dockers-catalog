FROM centos
MAINTAINER  levm "av@levm.eu"

# setup software requirements
RUN yum install -y java-1.7.0-openjdk lsof curl nmap telnet tar net-tools unzip bind-utils which
RUN rpm -Uvh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum --enablerepo=epel install -y supervisor
RUN mv -f /etc/supervisord.conf /etc/supervisord.conf.org
ADD supervisord.conf /etc/


# setup NEO4j
RUN mkdir -p /srv/neo4j
RUN  curl http://neo4j.com/artifact.php?name=neo4j-community-2.3.1-unix.tar.gz -o  /srv/neo4j/neo4j-community-unix.tar.gz
RUN  tar xvzf /srv/neo4j/neo4j-community-unix.tar.gz --strip-components 1 -C /srv/neo4j/
RUN rm /srv/neo4j/neo4j-community-unix.tar.gz

VOLUME /srv/neo4j/data

# configure neo4j
#RUN rm -rf /srv/neo4j/conf/neo4j.properties
#RUN rm -rf /srv/neo4j/conf/neo4j-server.properties
ADD neo4j.properties /srv/neo4j/conf/neo4j.properties
ADD neo4j-server.properties /srv/neo4j/conf/neo4j-server.properties

EXPOSE 80

CMD ["/usr/bin/supervisord"]


