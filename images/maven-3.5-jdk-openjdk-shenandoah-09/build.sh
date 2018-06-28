#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-openjdk-shenandoah-09 .
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-09:latest

docker tag svenruppert/maven-3.5-jdk-openjdk-shenandoah-09:latest svenruppert/maven-3.5-jdk-openjdk-shenandoah-09:1.9.0-230
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-09:1.9.0-230
