FROM centos:centos7
MAINTAINER  levm "av@levm.eu"

RUN yum -y update && yum clean all
RUN yum -y install epel-release && yum clean all
RUN yum -y install ruby
RUN yum -y install gcc gcc-c++ make automake autoconf zlib-devel #todo tune dependencies  curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
RUN yum install -y rubygems-devel.noarch ruby-devel.x86_64
RUN yum install -y libxml2-devel libxslt-devel
RUN gem install nokogiri -- --use-system-libraries
RUN gem install middleman

#RUN yum install -y git
#RUN gem install eventmachine -v '1.0.3'
#RUN yum install -y npm
#RUN npm install bower
#RUN middleman init my_new_project --template=https://github.com/headcanon/middleman-bower-template.git
#RUN cd my_new_project/ && bower install
#RUN gem install rack rb-fsevent rb-inotify rack-test
#RUN middleman server

ENTRYPOINT ["middleman"]