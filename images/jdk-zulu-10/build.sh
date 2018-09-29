#!/bin/bash
docker build -t svenruppert/jdk-zulu-10 .
docker push svenruppert/jdk-zulu-10:latest

docker tag svenruppert/jdk-zulu-10:latest svenruppert/jdk-zulu-10:1.10.0-2
docker push svenruppert/jdk-zulu-10:1.10.0-2

