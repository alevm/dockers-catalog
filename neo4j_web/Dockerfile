FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

# Enable EPEL for Node.js
RUN yum install -y epel-release
# Install Node.js and npm
RUN yum install -y nodejs npm
ADD package.json /opt/
RUN cd /opt ; npm install
ADD data /srv
#RUN cd /srv/api ; npm install
RUN cd /srv/web ; npm install
#RUN npm install http-server -g #should go in packages
VOLUME /srv
EXPOSE  5000
CMD ["node", "/srv/web/app.js"]
#CMD ["bash"]

# docker run --name neo4j_web -e service_name=neo4j_web  -p 8080:8080 alevm/datavisual #-v ~/repos/datavisual/:/srv/data/content
