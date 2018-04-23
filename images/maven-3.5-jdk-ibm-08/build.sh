!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-ibm-08 .
docker push svenruppert/maven-3.5-jdk-ibm-08:latest

docker tag svenruppert/maven-3.5-jdk-ibm-08:latest svenruppert/maven-3.5-jdk-ibm-08:1.8.0-5.10
docker push svenruppert/maven-3.5-jdk-ibm-08:1.8.0-5.10

