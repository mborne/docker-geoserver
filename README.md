
# mborne/docker-geoserver

> [DEV] This repository is kept to give an example on how to build docker. An [official GeoServer Docker image](https://docs.geoserver.org/main/en/user/installation/docker/#quick-start) is now available at [docker.osgeo.org/geoserver](https://docker.osgeo.org/#browse/browse:docker).

## Description

Illustration de la construction d'une [image docker mborne/geoserver stockée sur ghcr.io](https://github.com/mborne/docker-geoserver/pkgs/container/geoserver) dans le cadre du cours [mborne/cours-devops](https://github.com/mborne/cours-devops#readme).

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
docker build -t mborne/geoserver:2.28.4 .
# avec docker compose
docker compose build
```

Nous soulignerons l'intérêt des arguments de construction pour construire plusieurs versions avec un même [Dockerfile](Dockerfile) :

```bash
docker build \
    --build-arg version=2.28.5 \
    -t mborne/geoserver:2.28.5 .
```


## Intégration continue

Voir [GitHub actions](docs/ci-github-actions.md)

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
    mborne/geoserver:2.28.4

# Arrêt du conteneur
docker stop geoserver

# Suppression du conteneur
docker rm geoserver
```

## Licence

[MIT](LICENSE)
