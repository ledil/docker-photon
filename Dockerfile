FROM elasticsearch:5.6.14-alpine

ADD . /photon

WORKDIR /photon

RUN wget http://photon.komoot.de/data/photon-0.3.0.jar

RUN wget -O - http://download1.graphhopper.com/public/photon-db-de-181217.tar.bz2 | bzip2 -cd | tar x

EXPOSE 2322

ENV JAVA_OPTS=""

ENV PHOTON_OPTS=""

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar photon-0.3.0.jar $PHOTON_OPTS"]
