FROM svenruppert/maven-3.5-no-jdk:maven-3.5.3
MAINTAINER sven.ruppert@gmail.com

ARG USER_HOME_DIR="/root"

RUN curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
    JABBA_COMMAND="install adopt@1.8.162-00 -o /jdk" bash

ENV JAVA_HOME /jdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

#COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
#COPY settings-docker.xml /usr/share/maven/ref/

#ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]