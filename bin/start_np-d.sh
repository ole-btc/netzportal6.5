#!/bin/bash

docker-compose -f ../docker-compose/np6.5-mysql.yml
echo "Waiting 10 sec for DB to come up"
sleep 10

docker-compose -f ../docker-compose/np6.5-portal-d.yml
echo "Waiting another 10 sec for Netzportal to come up"
sleep 10

docker-compose -f ../docker-compose/np6.5-nginx.yml

sleep 3
docker ps
