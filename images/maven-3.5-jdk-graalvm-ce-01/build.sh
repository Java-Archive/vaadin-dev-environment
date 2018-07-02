#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-graalvm-ce-01 .
docker push svenruppert/maven-3.5-jdk-graalvm-ce-01:latest

docker tag svenruppert/maven-3.5-jdk-graalvm-ce-01:latest svenruppert/maven-3.5-jdk-graalvm-ce-01:1.0-RC2
docker push svenruppert/maven-3.5-jdk-graalvm-ce-01:1.0-RC2

