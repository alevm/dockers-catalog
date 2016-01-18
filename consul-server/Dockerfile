FROM    centos:centos7
MAINTAINER  levm "av@levm.eu"

ADD ./config /config/
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip /tmp/webui.zip
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /tmp/webui.zip
ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /tmp/consul.zip
RUN cd /tmp && unzip webui.zip -d /bin/consul && rm consul.zip
RUN cd /tmp && mkdir /ui && unzip webui.zip -d /ui && rm webui.zip
RUN  mkdir /etc/consul.d
ADD ./consul.d  /etc/consul.d

ENTRYPOINT ["/bin/consul", "agent", "-server", "-config-dir=/etc/consul.d"]
