FROM centos

MAINTAINER lifescks09@gmail.com
Run yum -y update && \
    yum -y install wget && \
    yum install -y tar.x86_64 && \
    yum clean all

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/lifescks09/webapp.gitSampleWebApp.war

EXPOSE 9090

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
