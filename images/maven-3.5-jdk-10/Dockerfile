FROM svenruppert/maven-3.5-no-jdk:maven-3.5.3
MAINTAINER sven.ruppert@gmail.com

ARG USER_HOME_DIR="/root"

RUN curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | \
#    JABBA_COMMAND="install adopt@1.10.0-46 -o /jdk" bash
    JABBA_COMMAND="install adopt@1.10.0-GA=tgz+https://download.java.net/java/GA/jdk10/10/binaries/openjdk-10_linux-x64_bin.tar.gz -o /jdk" bash

ENV JAVA_HOME /jdk
ENV PATH $JAVA_HOME/bin:$PATH

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
