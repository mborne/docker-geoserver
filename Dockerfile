# see https://docs.geoserver.org/main/en/user/production/java/
FROM tomcat:9.0-jdk21

ARG version=2.28.4

ENV GEOSERVER_DATA_DIR=/var/geoserver-data-dir
ENV geoserver.xframe.shouldSetPolicy=false

# Renommage de l'utilisateur existant ubuntu en tomcat
RUN groupmod --new-name tomcat ubuntu \
  && usermod --login tomcat --home "$CATALINA_HOME" --gid tomcat ubuntu

WORKDIR /tmp

# Téléchargement et extraction du war
RUN apt-get update \
 && apt-get install -y wget unzip \
 && wget --progress=bar:force -O geoserver-war.zip http://sourceforge.net/projects/geoserver/files/GeoServer/${version}/geoserver-${version}-war.zip \
 && unzip geoserver-war.zip \
 && mkdir -p $CATALINA_HOME/webapps/geoserver \
 && unzip -d $CATALINA_HOME/webapps/geoserver geoserver.war \
 # on déplace le répertoire de données dans un volume pour persistance
 && mv "$CATALINA_HOME/webapps/geoserver/data" $GEOSERVER_DATA_DIR \
 # on limite la taille de l'image
 && apt-get remove -y wget unzip \
 && rm -rf geoserver.war \
 && rm -rf /var/lib/apt/lists/*

RUN chown -R tomcat $CATALINA_HOME

RUN chown -R tomcat:tomcat $GEOSERVER_DATA_DIR
VOLUME $GEOSERVER_DATA_DIR

WORKDIR $GEOSERVER_DATA_DIR
USER tomcat
