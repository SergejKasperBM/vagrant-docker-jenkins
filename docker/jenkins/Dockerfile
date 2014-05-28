FROM phusion/baseimage
MAINTAINER Sergejkasper <s.kasper@brink-martens.de>

ENV JENKINS_HOME /var/lib/jenkins

RUN apt-get update
RUN apt-get -y install wget git

RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean

RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y jenkins

VOLUME /var/lib/jenkins

EXPOSE 8080

#!!!!The following insecure ssh key is for development environments only!!!!
#for production comment out the "insecure key" feature and uncomment the commented lines below to use a custom ssh key
RUN /usr/sbin/enable_insecure_key
#ADD your_key /tmp/your_key
#RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key

# Add jenkins skript
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# Add jenkins deamon
RUN mkdir -p /etc/service/jenkins
ADD jenkins.sh /etc/service/jenkins/run
RUN chmod +x /etc/service/jenkins/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]