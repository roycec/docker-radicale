# docker-radicale
Run radicale in docker container (also see https://github.com/Kozea/Radicale)

This configuration is based on https://github.com/tomsquest/docker-radicale and works with Radicale version 2.

In my case Radicale runs on port 5232 on localhost of the host. You will need some kind of proxy that sits in front of Radicale (e.g. Nginx). The proxy terminates potential TLS encryption. The image contains a healthcheck which can be used with docker-compose.

## Build docker image

`cd /path/to/dockerfile`

`sudo docker build -t radicale:3.1.1-1 .`

## Run container with docker-compose

`sudo docker-compose up -d`

`sudo docker-compose ps`

## Proxy

In this case the HTTP proxy (Nginx) runs outside Docker.
