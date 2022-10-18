# Intégration continue avec GitHub

## Principe

Le fichier [.github/workflows/docker-publish.yml](../.github/workflows/docker-publish.yml) est configuré pour publier l'image [ghcr.io/mborne/geoserver](https://github.com/mborne/docker-geoserver/pkgs/container/geoserver)

## Résultat

Voir [https://github.com/mborne/docker-geoserver/actions](https://github.com/mborne/docker-geoserver/actions) pour l'exécution des tâches :

![Présentation du résultat par GitHub action](img/ci-github-actions.png)

Voir [https://github.com/mborne/docker-geoserver/pkgs/container/geoserver](https://github.com/mborne/docker-geoserver/pkgs/container/geoserver) pour les images publiées sur le dépôt github :

![Présentation des images docker](img/ghcr-mborne-geoserver.png)
