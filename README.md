# docker-radicale
Run radicale in docker container (also see https://github.com/Kozea/Radicale)

This configuration is based on https://github.com/tomsquest/docker-radicale

In my case Radicale runs on port 5232 on the localhost of the host. You will need some kind of proxy that sits in front of Radicale (e.g. Nginx). The image contains a healthcheck which can be used with docker-compose.

## Build docker image

`sudo docker build -t radicale:2.1.11`

## Run container with docker-compose

`sudo docker-compose up -d`
`sudo docker-compose ps`

**Todo:** Run Nginx and certbot/letsencrypt in container 
