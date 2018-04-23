!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-09 .
docker push svenruppert/maven-3.5-jdk-09:latest

docker tag svenruppert/maven-3.5-jdk-09:latest svenruppert/maven-3.5-jdk-09:1.9.0-181
docker push svenruppert/maven-3.5-jdk-09:1.9.0-181
