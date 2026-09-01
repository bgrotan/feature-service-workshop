# OGC API Features workshop med Geoserver

Denne workshopen er for å komme i gang med å etablere tjenester som OGC API *Features* med [Geoserver](https://www.geoserver.org),
og gjør deg kjent med hvordan den nye [OGC API Features](https://ogcapi.ogc.org/features/) -standarden fungerer.

Øvingene tar deg gjennom følgende steg:
* Få opp en kjørende instans av Geoserver med Docker
* Konsepter i Geoserver
* Installere plugins (OGC API Features) til Geoserver
* Laste inn data til database og tilgjengeliggjøre som OGC API Features
* Utforske data via OGC API Features - html og json
* Utforske OGC API Features via QGIS (frivillig)
* Utforske OGC API Features via Python (frivillig)

## TODO før workshop

Før du kommer på workshop, sørg for at du har en kopi av denne workshopen på din lokale maskin og installert påkrevde avhengigheter.

Om du har GIT, kan du klone denne kodebrønnen slik:
```
git clone https://github.com/bgrotan/feature-service-workshop.git
cd feature-service-workshop
```
Om du ikke har GIT-klient, kan du laste ned en ZIP-fil ved å klikke på **< > Code**-knappen, og deretter **Download ZIP**

Før du går i gang med øvingene, test at docker er satt opp riktig: 
```
# Sjekk at Docker-servicen kjører
docker ps

# Sjekk at du får lastet ned et docker-image
docker pull docker.osgeo.org/geoserver:3.0.0
docker pull kartoza/postgis:13.0
```

### Avhengigheter

* **Docker**
* **Tekstbehandler / IDE** (f.eks. Notepad++ for Windows-brukere)
* QGIS Desktop (anbefalt)
* Python 3.x (frivillig)
* GIT (frivillig), kan laste ned zip-fil fra github

## Øvinger

* [Øving 1](ovinger/oving-1.md) Få opp Geoserver med bruk av Docker (docker-compose)
* [Øving 2](ovinger/oving-2.md) Utvid Geoserver med støtte for OGC API Feature
* [Øving 3](ovinger/oving-3.md) Last inn kurs-data og etabler datasettet i Geoserver
* [Øving 4](ovinger/oving-4.md) Utforsk OGC API Features web-grensesnitt (html/json)
* [Øving 5](ovinger/oving-5.md) Utforsk OGC API Features med QGIS Desktop (bonus)
* [Øving 6](ovinger/python.md) Utforsk OGC API Features med Python (bonus)

 ## Løsningsforslag

* [Øving 1](losninger/oving-1-docker-compose.yml)
* [Øving 2](losninger/oving-2-docker-compose.yml)
* [Øving 3](losninger/oving-3-docker-compose.yml)

## Ressurser

* [Docker Compose](https://docs.docker.com/compose/)
* [Geoserver](https://geoserver.org/)
* [Freemarker Template](https://freemarker.apache.org/index.html)
* [PostgreSQL](https://www.postgresql.org/)
* [PostGIS](https://www.postgis.net)
* [Public LDProxy demo datasets for OGC API Features](https://demo.ldproxy.net/)

## Disclaimer

Denne workshopen er kun en introduksjon, for å komme i gang med utvikling og testing av OGC API Features på egen maskin.
Det er ikke anbefalt å bruke kurs-oppsett i et produksjonsmiljø.

Sett deg inn i proxy-settings, bruk av miljøvariabler (.env) for setting av admin-passord, etabler rullering av hemmeligheter m.m.
Kanskje har din organisasjon en egen PostgreSQL-server du kan benytte når du kommer tilbake.
