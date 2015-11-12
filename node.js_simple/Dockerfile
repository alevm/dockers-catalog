FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm
COPY ./npm-dev-env-grunt/ /src # todo not to add cause will requires a rebuild each time (d3js cockbook)
RUN cd /src; npm install
EXPOSE  8080
CMD ["node", "/src/index.js"]

