FROM centos
MAINTAINER av@levm.eu

# setup software requirements
RUN yum install -y java-1.7.0-openjdk lsof net-tools telnet
RUN rpm -Uvh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum --enablerepo=epel install -y supervisor
RUN mv -f /etc/supervisord.conf /etc/supervisord.conf.org
ADD supervisord.conf /etc/

# setup net
# EXPOSE 7474
# EXPOSE 1337

# setup envs
ENV NEO4J_BRANCH 2.2.1
ENV NEO4J_HOME /srv/neo4j
WORKDIR ${NEO4J_HOME}

# setup NEO4j
RUN mkdir -p /srv/neo4j 
RUN wget http://neo4j.com/artifact.php?name=neo4j-community-$NEO4J_BRANCH-unix.tar.gz -o /srv/neo4j/neo4j-community-$NEO4J_BRANCH-unix.tar.gz
RUN tar xf /srv/neo4j/neo4j-community-$NEO4J_BRANCH-unix.tar.gz $NEO4J_HOME

# configure neo4j
RUN rm -rf /srv/neo4j/conf/neo4j.properties
RUN rm -rf /srv/neo4j/conf/neo4j-server.properties
ADD neo4j.properties /srv/neo4j/conf/neo4j.properties
ADD neo4j-server.properties /srv/neo4j/conf/neo4j-server.propert

CMD ["/usr/bin/supervisord"]


