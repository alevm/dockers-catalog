FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

# Enable EPEL for Node.js
RUN  yum install -y epel-release
# Install Node.js and npm
RUN   yum install -y nodejs npm
ADD ./npm-dev-env-grunt/ /src # todo not to add cause will requires a rebuild each time (d3js cockbook)
RUN cd /src; npm install
EXPOSE  8080
CMD ["node", "/src/index.js"]

