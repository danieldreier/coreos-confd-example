FROM debian:wheezy
MAINTAINER Daniel Dreier <daniel@deployto.me>

#EXPOSE 9200
RUN apt-get -y update
RUN apt-get -y install procps vim wget rubygems ca-certificates

RUN wget https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz
RUN tar -xzvf etcd-v0.3.0-linux-amd64.tar.gz
RUN cp etcd-v0.3.0-linux-amd64/etc* /usr/local/bin
RUN gem install etcd

RUN wget -O confd_0.3.0_linux_amd64.tar.gz https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz
RUN tar -zxvf confd_0.3.0_linux_amd64.tar.gz
RUN mv confd /usr/local/bin/confd
RUN mkdir -p /etc/confd/{conf.d,templates}
ADD myconfig.toml /etc/confd/conf.d/myconfig.toml
ADD myconfig.conf.tmpl /etc/confd/templates/myconfig.conf.tmpl
ADD confd.toml /etc/confd/confd.toml
