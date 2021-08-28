#!/bin/bash

# start the web server
(cd web_server && sh ./start_container.sh)

# find the docker id of the web server
APP_ID=`docker ps --format "{{.ID}}\t{{.Names}}" | grep hello_server | awk '{print $1}'`

# start topz sidecar
docker run -d --pid=container:${APP_ID} \
    -p 8080:8080 \
    brendanburns/topz:db0fa58 \
    /server -addr=0.0.0.0:8080

# see what we can get!
echo "\naccessing localhost:8000"
curl localhost:8000
echo "\n\naccessing localhost:8080/topz"
curl localhost:8080/topz