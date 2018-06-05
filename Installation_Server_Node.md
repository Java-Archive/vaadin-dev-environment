# Installation Server Node

+ log in to fresh installed node
+ nano /etc/hostname
    + switch the name to the planned one here: **dev.rapidpm.org**
+ apt-get update
+ apt-get upgrade
+ reboot

## optional webmin installation
apt-get install libnet-ssleay-perl
apt-get install libcrypt-ssleay-perl

+ nano /etc/apt/sources.list
    + deb https://download.webmin.com/download/repository sarge contrib
+ cd /root
+ wget http://www.webmin.com/jcameron-key.asc
+ apt-key add jcameron-key.asc
+ apt-get install apt-transport-https
+ apt-get update
+ apt-get install webmin

Webmin should run on port **10000**.

## Docker Installation
+ apt-get remove docker docker-engine docker.io
+ apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
+ curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
+ apt-key fingerprint 0EBFCD88
+ add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
+ apt-get update
+ apt-get install docker-ce
+ docker run hello-world

+ groupadd docker
+ usermod -aG docker $USER
+ systemctl enable docker


+ docker run -d --restart=always --name=socat -p 2376:2375 -v /var/run/docker.sock:/var/run/docker.sock alpine/socat TCP4-LISTEN:2375,fork,reuseaddr UNIX-CONNECT:/var/run/docker.sock
+ sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
+ sudo chmod +x /usr/local/bin/docker-compose
+ docker-compose --version

## Vaadin Development env
+ apt-get install git
+ mkdir /opt/vaadin/
+ cd /opt/
+ chgrp docker vaadin/
+ cd vaadin
+ git clone https://github.com/vaadin-developer/vaadin-dev-environment.git

+ add folder
    mkdir vaadin-dev-environment/development/youtrack/backups
    mkdir vaadin-dev-environment/development/youtrack/conf
    mkdir vaadin-dev-environment/development/youtrack/data
    mkdir vaadin-dev-environment/development/youtrack/logs

    mkdir vaadin-dev-environment/development/upsource/backups
    mkdir vaadin-dev-environment/development/upsource/conf
    mkdir vaadin-dev-environment/development/upsource/data
    mkdir vaadin-dev-environment/development/upsource/logs

+ chgrp -R docker /opt/vaadin/vaadin-dev-environment/
+ chmod -R u+rwX,go+rwX,go+rwX /opt/vaadin/

### prepare Selenoid
+ cd vaadin-dev-environment/development/

docker run --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v `pwd`/selenoid/:/root/.aerokube/selenoid/ \
aerokube/cm:latest \
selenoid configure \
--tmpfs 128 \
--browsers "chrome;firefox;opera;android" \
--last-versions 4

docker run --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v `pwd`/selenoid/:/root/.aerokube/selenoid/ \
aerokube/cm:latest \
selenoid configure \
--tmpfs 128 \
--browsers "chrome;firefox;opera;android" \
--last-versions 4 --vnc

### config the individual settings
+ nano .env
+ docker-compose create
+ docker-compose start




