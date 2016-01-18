FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

RUN yum install -y epel-release
RUN yum install -y unzip

#ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip /tmp/webui.zip
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /tmp/webui.zip
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /tmp/consul.zip

RUN cd /tmp && unzip consul.zip -d /bin/ && rm consul.zip
RUN chmod 755 /bin/consul
RUN cd /tmp && mkdir /ui && unzip webui.zip -d /ui && rm webui.zip

RUN mkdir /config
RUN mkdir /data
ADD ./consul.d  /config

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
ENV DNS_RESOLVES consul
ENV DNS_PORT 8600
ENTRYPOINT ["/bin/consul", "agent", "-server", "-config-dir=/config", "-data-dir=/data"]

#ENTRYPOINT ["/bin/bash"]