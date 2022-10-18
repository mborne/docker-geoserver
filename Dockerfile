FROM tomcat:9.0-jdk11

ARG version=2.21.1

ENV GEOSERVER_DATA_DIR=/var/geoserver-data-dir
ENV geoserver.xframe.shouldSetPolicy=false

WORKDIR /tmp

# téléchargement du war geoserver
RUN apt-get update \
 && apt-get install -y wget unzip \
 && wget --progress=bar:force -O geoserver-war.zip http://sourceforge.net/projects/geoserver/files/GeoServer/${version}/geoserver-${version}-war.zip \
 && unzip geoserver-war.zip \
 && mkdir -p $CATALINA_HOME/webapps/geoserver \
 && unzip -d $CATALINA_HOME/webapps/geoserver geoserver.war \
 && rm -rf $CATALINA_HOME/webapps/geoserver/data \
 && rm -rf geoserver.war \
 && rm -rf /var/lib/apt/lists/*

# exécution en non root
RUN addgroup --system --gid 1000 tomcat \
  && adduser --system --uid 1000 --gid 1000 tomcat \
  && chown -R tomcat $CATALINA_HOME

# externalisation des données de geoserver
RUN mkdir /var/geoserver-data-dir \
 && chown tomcat:tomcat /var/geoserver-data-dir
VOLUME /var/geoserver-data-dir
WORKDIR /var/geoserver-data-dir

USER tomcat
