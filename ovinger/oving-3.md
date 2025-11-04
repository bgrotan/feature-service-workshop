# Øving 3

I denne øvingen skal du legge inn datasettet vi skal tilgjengeliggjøre som OGC API Features.
Workshop-datasettet er Administrative enheter, lasted ned fra geonorge 

## 3.1 Gjenbruk docker-compose.yml fra øving 2 

Inni docker, lever våre data i mappen /opt/geoserver_data
Når vi utvikler med docker, kan vi montere lokale data inn til docker-containere ved å bruke
volumer (volumes). Konfigurasjonen under er fra øving 1, og mapper/monterer
mappen data/geoserver (fra samme mappe som man kjører docker-compose fra) inn til /opt/geoserver_data

```
      volumes:
      - ./data/geoserver:/opt/geoserver_data
```

Oppgaven består i å kopiere fil fra workshop_data til data/geoserver/

## 3.2 

Start/restart geoserver: 'docker-compose down geoserver' og `docker-compose up -d`

* Verifiser at docker containeren kjører: 'docker ps'
* Verifiser at geoserver er operativ ved å åpne nettleseren og gå til [http://localhost:8080/geoserver](http://localhost:8080/geoserver)
* Sjekk at geoserver har funnet dataene (hint: se etter datastore) 

## 3.3 Logg inn i geoserver og verifise at plugin/utvidelsen er lastet inn 

http://localhost:8080/geoserver/ogc/features/v1

https://docs.geoserver.org/main/en/user/services/features/config.html

Neste: [Øving 4](oving-4.md)
