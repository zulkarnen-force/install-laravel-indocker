#!/bin/bash

docker build -t zulkarnen/laravel-install .
docker run --rm -it --entrypoint /entrypoint.sh -p 8000:80  docker.io/zulkarnen/laravel-install
