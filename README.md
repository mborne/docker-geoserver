
# mborne/geoserver

> This repository is kept to give a example on how to build docker image. [Explore available available images for geoserver Docker Hub](https://hub.docker.com/search?q=geoserver).

## Description

Illustration de la construction d'une image GeoServer dans le cadre du cours [mborne/cours-devops](https://github.com/mborne/cours-devops#readme).

## Construction de l'image

### Construction manuelle

```bash
docker build -t mborne/geoserver:2.21.1 .
```
### Construction avec github actions

**TODO**

## Utilisation de l'image

### Avec docker

```bash
docker run --rm -ti -p 8082:8080 mborne/geoserver:2.21.1
```

### Avec docker compose


* Start geoserver : `docker-compose up -d`

* Open http://geoserver.localhost/

* Login with admin/geoserver


