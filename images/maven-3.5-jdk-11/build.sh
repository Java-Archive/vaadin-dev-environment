!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-11 .
docker push svenruppert/maven-3.5-jdk-11:latest

docker tag svenruppert/maven-3.5-jdk-11:latest svenruppert/maven-3.5-jdk-11:1.11.0-10
docker push svenruppert/maven-3.5-jdk-11:1.11.0-10

