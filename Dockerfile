FROM tomcat:8
MAINTAINER swethamba859@gmail.com
COPY /target/*.war /usr/local/tomcat/webapps/dockeransible.war
EXPOSE 5000
