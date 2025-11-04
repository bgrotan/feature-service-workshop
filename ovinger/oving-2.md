# Øving 2

I denne øvingen skal du utvide geoserver-oppsettet med OGC API Features-utvidelsen (plugin)


## 2.1 Utvid docker-compose.yml fra øving 1

Å installere plugins gjennom docker er ganske enkelt. Det styres gjennom miljøvariablene
INSTALL_EXTENSIONS og STABLE_EXTENSIONS 

```
    environment:
      - INSTALL_EXTENSIONS=true 
      - STABLE_EXTENSIONS=ogcapi-features
      - GEOSERVER_ADMIN_PASSWORD=********
```

## 2.2 

Start/restart geoserver: 'docker-compose down geoserver' og `docker-compose up -d`

* Verifiser at docker containeren kjører: 'docker ps'
* Verifiser at geoserver er operativ ved å åpne nettleseren og gå til (http://localhost:8080/geoserver)

## 2.3 Logg inn i geoserver og verifise at plugin/utvidelsen er lastet inn 

(http://localhost:8080/geoserver/ogc/features/v1)


Neste: (oving-3.md)
