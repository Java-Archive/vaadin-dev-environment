# stagemonitor docker-compose

This docker-compose file consists of Elasticsearch, Grafana and Kibana with the [stagemonitor Kibana plugin](https://github.com/stagemonitor/stagemonitor-kibana).

## Prerequisites
Docker and docker-compose

## Run

```
git clone https://github.com/stagemonitor/stagemonitor-docker-compose.git
cd stagemonitor-docker-compose
docker-compose build
docker-compose up
```

To start the containers in the background run `docker-compose up -d`.

It can take several minutes to build the image. Especially, the build step `Optimizing and caching browser bundles...`.
If you want to get started quicker, comment out the build line and uncomment the image line.


Also, the first startup of Kibana can take a while. Don't give up when you see this message: 
```
Optimizing and caching bundles for stagemonitor-kibana, kibana, stateSessionStorageRedirect, timelion and status_page. This may take a few minutes
```

A few minutes later, you'll see this log message which indicates Kibana is now ready to be accessed.

```
Optimization of bundles for stagemonitor-kibana, kibana, stateSessionStorageRedirect, timelion and status_page complete in 163.71 seconds
```

## Elasticsearch

| Type of Elasticsearch installation    | Elasticsearch URL         |
|---------------------------------------|---------------------------|
| docker-compose on local linux machine or docker for mac/windows | [http://localhost:9200](http://localhost:9200) |
| docker-compose with docker toolbox    | http://192.168.99.100:9200 *|

`*` The IP can vary. Execute `docker-machine ip default` to see the actual IP if the default one doesn't work

## Kibana
| Type of Kibana installation           | Kibana URL                |
|---------------------------------------|---------------------------|
| docker-compose on local linux machine or docker for mac/windows | [http://localhost:5601](http://localhost:5601) |
| docker-compose with docker toolbox    | http://192.168.99.100:5601 *|

`*` The IP may vary. Execute `docker-machine ip default` to see the actual IP if the default one doesn't work


## Grafana
| Type of Grafana installation          | Grafana URL                |
|---------------------------------------|----------------------------|
| docker-compose on local linux machine or docker for mac/windows | [http://localhost:3000](http://localhost:3000) |
| docker-compose with docker toolbox    | http://192.168.99.100:3000 *|

`*` The IP may vary. Execute `docker-machine ip default` to see the actual IP if the default one doesn't work
