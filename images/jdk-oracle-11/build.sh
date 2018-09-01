#!/bin/bash
docker build -t svenruppert/jdk-oracle-11 .
docker push svenruppert/jdk-oracle-11:latest

docker tag svenruppert/jdk-oracle-11:latest svenruppert/jdk-oracle-11:1.11.0-28
docker push svenruppert/jdk-oracle-11:1.11.0-28

