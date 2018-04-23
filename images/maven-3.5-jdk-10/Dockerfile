FROM svenruppert/maven-3.5-no-jdk:maven-3.5.3
MAINTAINER sven.ruppert@gmail.com

ARG USER_HOME_DIR="/root"

RUN curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
#    JABBA_COMMAND="install adopt@1.10.0-46 -o /jdk" bash
    JABBA_COMMAND="install adopt@1.10.1=tgz+https://download.java.net/java/GA/jdk10/10.0.1/fb4372174a714e6b8c52526dc134031e/10/openjdk-10.0.1_osx-x64_bin.tar.gz -o /jdk" bash

ENV JAVA_HOME /jdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
