FROM tomcat:8
MAINTAINER cbabu85@gmail.com
COPY /target/*.war /usr/local/tomact/webapps/dockeransible.war
