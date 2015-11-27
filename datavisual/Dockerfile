FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

# Enable EPEL for Node.js
RUN yum install -y epel-release
# Install Node.js and npm
RUN yum install -y nodejs npm
ADD package.json /opt/
RUN cd /opt ; npm install
RUN npm install http-server -g #should go in packages
VOLUME /srv
EXPOSE  8080
CMD ["http-server", "/srv/"]