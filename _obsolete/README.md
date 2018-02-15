# Obsolete Elements
Here you can find elements, that are used once within 
the development environment.


## Drone CLI
Drone CLI will give you access to the CLI Interface
that DroneCI is offering.
To use this one, you have to log into the
DroneCLI Docker Container.

### docker-compose

````
  drone-cli:
    container_name: drone-cli
    hostname: drone-cli
    build: droneio-cli
    restart: always
    depends_on:
      - drone-server
    environment:
      - DRONE_SERVER=http://drone-server:8000
      - DRONE_TOKEN=${DRONE_DOCKER_SEC_TOKEN}
    stdin_open: true
    tty: true

````

