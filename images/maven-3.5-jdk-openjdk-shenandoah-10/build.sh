#!/bin/bash
docker build -t svenruppert/maven-3.5-jdk-openjdk-shenandoah-10 .
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-10:latest

docker tag svenruppert/maven-3.5-jdk-openjdk-shenandoah-10:latest svenruppert/maven-3.5-jdk-openjdk-shenandoah-10:1.10.0-254
docker push svenruppert/maven-3.5-jdk-openjdk-shenandoah-10:1.10.0-254
