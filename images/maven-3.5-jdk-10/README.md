# Maven - JDK 10 - Docker Image

```
docker build -t svenruppert/maven-3.5-jdk-10 .
docker push svenruppert/maven-3.5-jdk-10:latest

docker tag svenruppert/maven-3.5-jdk-10:latest svenruppert/maven-3.5-jdk-10:1.10.0-GA
docker push svenruppert/maven-3.5-jdk-10:1.10.0-GA
```
