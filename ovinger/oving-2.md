# Øving 2

I denne øvingen skal du utvide geoserver-oppsettet med OGC API Features-utvidelsen (plugin)


## 2.1 Utvid docker-compose.yml fra øving 1

Å installere plugins gjennom docker er ganske enkelt. Det styres gjennom miljøvariablene
INSTALL_EXTENSIONS og STABLE_EXTENSIONS 

```
    environment:
      - INSTALL_EXTENSIONS=true 
      - STABLE_EXTENSIONS=ogcapi-features      
```

## 2.2 

Start/restart geoserver: 
```
docker-compose down
docker-compose up -d
```

NB! Ved å utvide Geoserver med *Extensions* i oppgave 2.1, vil Geoserver Docker bygge et nytt image som inkluderer de valgte extensions.
Dette kan ta litt tid første gangen, ca 30-120 sekunder er normalt. 

* Verifiser at docker containeren kjører: `docker ps`
* Følg med hvor langt Geoserver-containeren har kommet:  `docker logs -f geoserver`
* Verifiser at geoserver er operativ ved å åpne nettleseren og gå til [http://localhost:8080/geoserver](http://localhost:8080/geoserver)

## 2.3 Logg inn i geoserver og verifise at plugin/utvidelsen er lastet inn 

(http://localhost:8080/geoserver/ogc/features/v1)

Neste: [Øving 3](oving-3.md)
