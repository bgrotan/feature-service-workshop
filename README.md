# OGC API Features workshop med Geoserver

Denne workshopen er for å komme i gang med å etablere tjenester som OGC APIFeatures med Geoserver,
og gjør deg kjent med hvordan den nye OGC API Features-standarden fungerer.

Øvingene tar deg gjennom følgende steg:
* Få opp en kjørende instans av Geoserver med Docker
* Installere plugins (OGC API Features) til Geoserver
* Konsepter i Geoserver (Datastores m.m.)
* Laste inn data til database og tilgjengeliggjøre som OGC API Features
* Utforske data via OGC API Features - html og json
* Utforske OGC API Features via QGIS (frivillig)
* Utforske OGC API Features via Python (frivillig)

## Datasett

Test-data (Administrative enheter) for formålet er hentet fra Geonorge.

## Avhengigheter

* Docker
* QGIS Desktop (anbefalt)
* Python 3.x (frivillig
* GIT (frivillig), kan laste ned zip-fil fra github

## Øvinger

* [Øving 1](ovinger/oving-1.md)
* [Øving 2](ovinger/oving-2.md)
* [Øving 3](ovinger/oving-3.md)
* [Øving 4](ovinger/oving-4.md)
* [Øving 5](ovinger/oving-5.md)

 ## Løsningsforslag

* [Øving 1](losninger/oving-1.md)
* [Øving 2](losninger/oving-2.md)
* [Øving 3](losninger/oving-3.md)
* [Øving 4](losninger/oving-4.md)
* [Øving 5](losninger/oving-5.md)

## Ressurser

* [Docker Compose](https://docs.docker.com/compose/)
* [Geoserver](https://geoserver.org/)
* [Freemarker Template](https://freemarker.apache.org/index.html)
* [PostgreSQL](https://www.postgresql.org/)
* [PostGIS](https://www.postgis.net)

## Disclaimer

Denne workshopen er kun en introduksjon, for å komme i gang med utvikling og testing av OGC API Features på egen maskin.
Det er ikke anbefalt å bruke kurs-oppsett i et produksjonsmiljø.
  
  Sett deg inn i proxy-settings, bruk av miljøvariabler (.env) for setting av admin-passord, etabler rullering av hemmeligheter m.m.
  Kanskje har din organisasjon en egen PostgreSQL-server du kan benytte når du kommer tilbake.
