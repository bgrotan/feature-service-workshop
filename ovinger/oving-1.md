# Øving 1

I denne øvingen skal du sette opp miljøet og starte med en enkel instans av geoserver,
du skal verifisere kjørende miljø gjennom nettleser og du skal legge til Features-utvidelsen til Geoserver.

## 1.1 Etablere docker-compose.yml

Lag deg en fil 'docker-compose.yml' med innholdet under. Bytt ut '<versjon>' med 2.28.2


```
version: '3.8'

services:
  geoserver:
    image: kartoza/geoserver:<versjon>
    container_name: geoserver
    ports:
      - "8080:8080"
    volumes:
      - ./data:/opt/geoserver/data_dir
    environment:
      - GEOSERVER_ADMIN_PASSWORD=geoserver
    restart: unless-stopped
```

## 1.2 

Start geoserver: `docker-compose up -d`

* Verifiser at docker containeren kjører: 'docker ps'
* Verifiser at geoserver er operativ ved å åpne nettleseren og gå til (http://localhost:8080/geoserver)

## 1.3

Verifiser at du kan se geoserver-logger (fint til feilsøking)

'docker-compose logs -f geoserver'

(-f gir deg sanntids-logger, avslutt med ctrl-c og kjør samme kommando uten -f og se hva som skjer)

## 1.4 Logg inn i geoserver admin-konsoll

http://localhost:8080/geoserver

Default admin-brukernavn er 'admin'. Du kan velge et annet brukernavn ved å sette miljøvariabel.
Admin-passord settes som miljøvariabel GEOSERVER_ADMIN_PASSWORD (se docker-compose.yml)

## 1.5 Nyttige kommandoer

* `docker-compose up -d` starter containeren og bygger den om nødvendig
* `docker-compose start geoserver` starter containeren
* `docker-compose stop geoserver` stopper containeren
* `docker-compose restart geoserver` restarter containeren
* `docker-compose down geoserver` fjerner containeren

Du kan også teste ut 'docker-compose up" uten å angi '-d'. Bruk ctrl-c for å avslutte.

Neste: (oving-2.md)
