FROM ubuntu:14.10
MAINTAINER levm <av@levm.eu>
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y &&  apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:rael-gc/scudcloud
RUN apt-get -y update &&  apt-get install -y scudcloud hunspell-en-us

# Autorun 
ENTRYPOINT [ "scudcloud" ]
#CMD [ "", "" ]
