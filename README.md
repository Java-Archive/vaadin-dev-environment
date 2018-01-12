<center>
<a href="https://vaadin.com">
 <img src="https://vaadin.com/images/hero-reindeer.svg" width="200" height="200" /></a>
</center>

# Vaadin Developer Environment

The target of this project is a Vaadin Developer Environment,
based on docker-compose.

![_images/overview/overview-001.jpeg](_images/overview/overview-001.jpeg)


## Components
The components so far are:
 * Nexus:       [http://localhost:8081](http://localhost:8081) admin/admin123
 * Gogs:        [http://localhost:3000](http://localhost:3000) what you defined
 * DroneCI:     [http://localhost:8000](http://localhost:8000) user account from gogs
 * Selenoid UI: [http://localhost:8088](http://localhost:8080) no account

### Docker
You have to install Docker on all machines you want to be involved in this 
environment. Here I will describe a scenario that is based on two machines.
If you don´t want to use a Docker Registry as a cache, all is running on one machine.

* machine 1
    * name : docker host 1
    * ip : 192.168.0.100
    * OS: MAC OS
* machine 2
    * name : docker host 2
    * ip : 192.168.0.228
    * OS: MAC OS

Both machines are a Mac Book Pro, with 16GB RAM. Less hardware should fit, 
depending on the workload you are expecting. 
This is my personal, mobile developer and workshop environment.


### SOCAT Image
**TODO**

### Portainer - The Docker UI
**TODO**


### Docker Registry
The Docker Registry is used as a local Docker-Image cache. This should be on 
a Docker Host that is not the same as the developer Docker Host. Here you can decide 
if you want to cache the images only during the runtime of this container or 
on an external volume outside of the Docker Container.
So far, I prefer to use it in a non - persistent way to make sure that 
the Docker Registry could be regularly cleaned.

To start the Docker Registry you can copy the files from the folder **docker-registry**
to the host you want to use as the Registry. On this machine you only have to run a **docker-compose up**.

The Docker Host for the developer environment must be configured to use this Docker Registry as a cache.
If you are using a Mac you could do this by filling out the field for the 
Mirror. 

![_images/docker-registry/docker-registry_001.png](_images/docker-registry/docker-registry_001.png)

Make sure that you are using the external IP from the Docker Host.
In my case it is a **192.168.0.100:5500**

### Nexus
For every build inside a fresh Docker Container, you will need the 
dependencies to build your project. For example, if you are using 
maven, this will lead to a long list of jar-Files that are loaded
from maven - central and other repositories.
To increase speed, I recommend to use a 
local available cache, that can be used for all Docker Containers, as
well as for other Developer machines.

Here I will show you, how you can use this in combination with 
drone.io. But first: How to start your registry, that will 
be your proxy/mirror of the maven central? ;-) 

Inside the docker-compose file there is the section
called: **nexus-server**

```dockerfile
  nexus-server:
    container_name: nexus-server
    hostname: nexus-server
    image: sonatype/nexus3:latest
    ports:
      - 8081:8081
      - 8082:8082
      - 8083:8083
    restart: always
```

Additionally the consumer of this repo needs a section called
**mirrors** inside his used ***settings.xml***.

```xml
    <mirror>
      <id>central</id>
      <name>central</name>
      <url>http://nexus-server:8081/repository/maven-public/</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
```

The URL here, is based on the NameService resolution that can be used from docker-compose.
Until now, the storage of the repository manager (nexus) is transient between restarts.

### GOGS - the local github
With Gogs there is a local git - Server, that will be used for the 
development process. The CI-Services are using this as reference.
If wanted, github or bitbucket could be used as well. The main target here
is the 100 percent local managed solution, to be independent 
as much as possible from the outer internet. 

The git server needs some configuration.
After the first start, you have to go to the address DOCKER_HOST_IP:3000.
You will get a first config screen. Select as database **SQLite3** and scroll down the page. 


![_images/git-server/git-server_001.png](_images/git-server/git-server_001.png)

At the bottom you will have to fill out the details for the admin user you want to start with.
The username **admin** is reserved and could not be chosen.

![_images/git-server/git-server_002.png](_images/git-server/git-server_002.png)

Now you have the possibility to clone git repos into this Gogs instance.
All repositories you want to use together with the CI should be here.

### DroneCI
There are so many CI-Tools available, and most of them are bigger as you need.
But, for a lot of projects you can use the simple DroneCI.
DroneCI is split up in three parts. Number one is the CI-Server, 
that manages all CI-Agents and will be connected from the CI-CLI.
In this example we are not using Kubernetes or Docker Swarm. So all CI-Agents are 
running at the same physical machine.

````dockerfile
  drone-server:
    container_name: drone-server
    hostname: drone-server
    image: drone/drone:0.8
    ports:
      - 8000:8000
      - 9000:9000
    volumes:
      - ./droneio/drone:/var/lib/drone/
    restart: always
    depends_on:
      - nexus-server
      - git-server
    links:
      - nexus-server
      - git-server
    environment:
      - DRONE_HOST=http://${DRONE_DOCKER_EXTERNAL_IP}:8000
      - DRONE_OPEN=true
      - DRONE_SECRET=ok
      - DRONE_PLUGIN_PULL=true
      - DRONE_CACHE_TTY=1m
      - DRONE_DATABASE_DRIVER=sqlite3
      - DRONE_GOGS=true
      - DRONE_GOGS_URL=http://git-server:3000
      - DRONE_GOGS_SKIP_VERIFY=false
      - DRONE_GOGS_PRIVATE_MODE=true
````

Part number two is the group of CI-Agents. The are responsible to manage the 
build itself. This means, to create the Docker Container that is used to proceed the defined pipeline.

````dockerfile
  drone-agent:
    image: drone/agent:0.8
    restart: always
    depends_on:
      - drone-server
    links:
      - nexus-server
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - DRONE_SERVER=drone-server:9000
      - DRONE_SECRET=ok
````

Part number three is the CI-CLI. Here you can get a few information's about the status of this system
and builds can be trigged again and so on.

````dockerfile
  drone-cli:
    build: droneio-cli/
    container_name: drone-cli
    hostname: drone-cli
    restart: always
    depends_on:
      - drone-server
    links:
      - drone-server
    environment:
      - DRONE_SERVER=http://drone-server:8000
      - DRONE_TOKEN=${DRONE_DOCKER_SEC_TOKEN}
    stdin_open: true
    tty: true
````

There is only thing that we have to define after the first start of the DroneCI Server is the Security Token.
This should be pasted into the **.env** file. The Token could be found at:
**Menue -> Token -> Example CLI Usage**

### Selenoid

#### create the browsers.json

````bash
docker run --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v `pwd`/selenoid/:/root/.aerokube/selenoid/ \
aerokube/cm:latest \
selenoid configure \
--tmpfs 128 \
--browsers chrome,firefox,opera,phantomjs \
--last-versions 4
````

To reconfigure the browsers.json, delete the file in the folder
sel


