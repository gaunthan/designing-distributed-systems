#!/bin/bash

make clean
make

docker run -d -p 8000:8000 --name hello_server server/hello_server:v1