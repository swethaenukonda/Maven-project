FROM java:8
COPY /var/lib/jenkins/workspace/Jenkins-Maven-Pipeline-Job-3/dockeransible.war /opt/dockeransible.war
ENTRYPOINT ["java", "-war","/dockeransible.war"]
