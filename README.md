
# mborne/docker-geoserver

> [DEV] This repository is kept to give a example on how to build docker image. [Explore available available images for geoserver Docker Hub](https://hub.docker.com/search?q=geoserver).

## Description

Illustration de la construction d'une image GeoServer dans le cadre du cours [mborne/cours-devops](https://github.com/mborne/cours-devops#readme).

## Construction de l'image

### Construction manuelle

```bash
# avec docker
docker build -t mborne/geoserver:2.21.1 .
# avec docker compose
docker compose build
```
## Intégration continue

**TODO**

## Démarrage de GeoServer

### Avec docker

```bash
docker run --rm -ti -p 8082:8080 mborne/geoserver:2.21.1
```

### Avec docker compose

* Démarrer la stack : `docker-compose up -d`
* Ouvrir http://localhost:8082/
* Se connecter avec admin/geoserver


