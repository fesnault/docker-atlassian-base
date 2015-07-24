FROM phusion/baseimage:0.9.16
MAINTAINER Frederic Esnault <esnault.frederic@gmail.com>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y curl sudo unzip \
  software-properties-common python-software-properties

# Ensure we create the cluster with UTF-8 locale
RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# Install Java 7

RUN DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install oracle-java8-installer -y

# Create /opt/atlassian base directory
RUN mkdir -p /opt/atlassian
