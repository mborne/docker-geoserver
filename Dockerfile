FROM tomcat:9.0-jdk8

ARG version=2.16.1

#-------------------------------------------------------------------------
# Storage configuration
#-------------------------------------------------------------------------
ENV GEOSERVER_DATA_DIR=/var/geoserver
VOLUME /var/geoserver

#-------------------------------------------------------------------------
# Runtime params
# (inspired from https://hub.docker.com/r/geonode/geoserver/dockerfile)
#-------------------------------------------------------------------------
ENV geoserver.xframe.shouldSetPolicy=false
ENV JAVA_OPTS="-Djava.awt.headless=true -XX:MaxPermSize=512m -XX:PermSize=256m -Xms512m -Xmx2048m -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=4 -Dfile.encoding=UTF8 -Duser.timezone=GMT -Djavax.servlet.request.encoding=UTF-8 -Djavax.servlet.response.encoding=UTF-8 -Duser.timezone=GMT -Dorg.geotools.shapefile.datetime=true"

#-------------------------------------------------------------------------
# Install geoserver
#-------------------------------------------------------------------------
WORKDIR /usr/local/tomcat/webapps
RUN apt-get update \
 && apt-get install -y wget unzip \
 && wget --progress=bar:force -O geoserver-war.zip http://sourceforge.net/projects/geoserver/files/GeoServer/${version}/geoserver-${version}-war.zip \
 && unzip geoserver-war.zip \
 && unzip geoserver.war \
 && rm -rf geoserver/data \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/geoserver
