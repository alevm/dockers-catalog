FROM ubuntu:14.10
MAINTAINER levm <av@levm.eu>
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y &&  apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:rael-gc/scudcloud
RUN apt-get -y update &&  apt-get install -y scudcloud hunspell-en-us
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/anv && \
    echo "anv:x:${uid}:${gid}:Developer,,,:/home/anv:/bin/bash" >> /etc/passwd && \
    echo "anv:x:${uid}:" >> /etc/group && \
    echo "anv ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/anv && \
    chmod 0440 /etc/sudoers.d/anv && \
    chown ${uid}:${gid} -R /home/anv

USER anv
ENV HOME /home/anv
# Autorun 
#ENTRYPOINT [ "scudcloud" ] <- cannot be overriden for tests (i.e. running bash instead)
CMD [ "scudcloud" ]
