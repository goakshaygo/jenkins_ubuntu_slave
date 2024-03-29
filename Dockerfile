FROM ubuntu:xenial

LABEL version="1.0"
LABEL maintainer="goakshaygo <goakshaygo.inbox@gmail.com>"

EXPOSE 22

RUN apt-get update && apt-get install -qy -q bash wget
RUN apt-get install -qy ssh openjdk-8-jdk 
#RUN apt-get git 
#RUN apt-get install -qy maven
RUN ssh-keygen -A && mkdir -p /var/run/sshd
RUN sed -i '/PermitRootLogin prohibit-password/c\PermitRootLogin yes' /etc/ssh/sshd_config
RUN adduser --disabled-login --disabled-password --gecos "jenkins" jenkins &&\
    (echo "jenkins:jenkins" | chpasswd) && (echo "root:root" | chpasswd)

CMD ["/usr/sbin/sshd", "-D"]
