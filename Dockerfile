FROM tomcat:8
MAINTAINER cbabu85@gmail.com
COPY /target/*.war /usr/local/tomcat/webapps/dockeransible.war
