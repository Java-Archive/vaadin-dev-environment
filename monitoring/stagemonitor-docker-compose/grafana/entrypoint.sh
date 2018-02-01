#!/bin/bash

./run.sh "${@}" &
timeout 10 bash -c "until </dev/tcp/localhost/3000; do sleep 1; done"

curl -s -H "Content-Type: application/json" \
    -XPOST http://admin:admin@localhost:3000/api/datasources \
    -d @- <<EOF
{
	"orgId": 1,
	"name": "ES stagemonitor",
	"type": "elasticsearch",
	"typeLogoUrl": "",
	"access": "proxy",
	"url": "http://elasticsearch:9200",
	"password": "",
	"user": "",
	"database": "[stagemonitor-metrics-]YYYY.MM.DD",
	"basicAuth": false,
	"basicAuthUser": "",
	"basicAuthPassword": "",
	"withCredentials": false,
	"isDefault": false,
	"jsonData": {
		"esVersion": 5,
		"interval": "Daily",
		"timeField": "@timestamp",
		"timeInterval": ">10s"
	},
	"secureJsonFields": {}
}
EOF

pkill grafana-server
timeout 10 bash -c "while </dev/tcp/localhost/3000; do sleep 1; done"

exec ./run.sh "${@}"