
# mborne/docker-geoserver

> [DEV] This repository is kept to give a example on how to build docker image. [Explore available images for geoserver on Docker Hub](https://hub.docker.com/search?q=geoserver).

## Description

Illustration de la construction d'une image GeoServer dans le cadre du cours [mborne/cours-devops](https://github.com/mborne/cours-devops#readme).

## Explications

* Le fichier [Dockerfile](Dockerfile) donne les instructions pour construire l'image.
* L'image de base est l'image officielle [tomcat](https://hub.docker.com/_/tomcat)
* L'installation est basée sur le téléchargement du fichier WAR sur [https://geoserver.org/](https://geoserver.org/download/).
* Les données (`/var/geoserver-data-dir`) sont externalisées dans une volume pour qu'elles survivent à la suppression du conteneur.
* Un utilisateur tomcat est créé et utilisé pour l'exécution (exécuter les conteneurs en `root` étant fortement déconseillé)
* Le fichier [docker-compose](docker-compose.yml) apporte un exemple d'utilisation de l'image et il offre des facilités de construction.

## Construction de l'image

### Construction manuelle

```bash
# avec docker
docker build -t mborne/geoserver:2.21.1 .
# avec docker compose
docker compose build
```

Nous soulignerons l'intérêt des arguments de construction pour construire plusieurs versions avec un même [Dockerfile](Dockerfile) :

```bash
docker build \
    --build-arg version=2.20.6 \
    -t mborne/geoserver:2.20.6 .
```


## Intégration continue

**TODO**

## Utilisation de l'image

### Avec docker compose

* Démarrer la stack : `docker compose up -d`
* Ouvrir http://localhost:8082/geoserver/
* Se connecter avec admin/geoserver
* Arrêter la stack : `docker compose stop`
* Supprimer la stack : `docker compose down`
* Supprimer la stack et les volumes : `docker compose down --volumes`

### Avec docker

Nous pourrions avoir sensiblement le même résultat avec les commandes `docker` suivante :

```bash
# Création d'un volume
docker volume create geoserver-data

# Démarrage du conteneur
docker run -d \
    --name geoserver \
    -p 8082:8080 \
    -v geoserver-data:/var/geoserver-data-dir \
    --restart unless-stopped \
    mborne/geoserver:2.21.1

# Arrêt du conteneur
docker stop geoserver

# Suppression du conteneur
docker rm geoserver
```

## Licence

[MIT](LICENSE)
