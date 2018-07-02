#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-openjdk-shenandoah-08 .
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-08:latest

docker tag svenruppert/maven-3.5-jdk-openjdk-shenandoah-08:latest svenruppert/maven-3.5-jdk-openjdk-shenandoah-08:1.8.0-249
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-08:1.8.0-249
