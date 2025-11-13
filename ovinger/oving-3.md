# Øving 3

Mange som etablerer OGC API Features i egen organisasjon, kommer til å ha en tilgjengelig
PostgreSQL-database med PostGIS-utvidelsen tilgjengelig. For denne workshopen bruker vi 
en lokal PostgreSQL-database satt opp med Docker som en "side-car"-tjeneste.

I denne øvingen skal du legge inn datasettet vi skal tilgjengeliggjøre som OGC API Features.
Workshop-datasettet er Administrative enheter, lasted ned fra geonorge 

## 3.1 Etablere PostgreSQL i docker-compose.yml

* Gjenbruk docker-compose.yml fra øving 2
* Opprett mappen pg_data: `mkdir pg_data` - slik kan vi ta vare på data lastet inn i PostgreSQL selv om vi stopper og starter docker-containerne.
* Kopier inn følgende yml-struktur inn til docker-compose, legg det *mellom* **services** og **geoserver**.

```
  postgres:
    image: kartoza/postgis:13.0
    container_name: postgres
    ports:
      - "5433:5432"
    environment:
        - POSTGRES_USER=geoserver
        - POSTGRES_PASSWORD=geoserver
        - POSTGRES_DB=geoserver
    volumes:
      - ./pg_data:/var/lib/postgresql/data
      - ./workshop-data:/tmp/workshop-data
    restart: unless-stopped
    healthcheck:
      test: "exit 0" 
```

For å få nettverks-kommunikasjon mellom postgres og geoserver, må vi fortelle docker om avhengigheten.
Legg til denne i bunnen av geoserver-delen av docker-compose.yml. Navnet her er navnet du har gitt postgres-containeren
```
    depends_on:
      - postgres 
```

## 3.2 Importer workshop-data

Når vi utvikler med docker, kan vi montere lokale data inn til docker-containere ved å bruke volumer (volumes).
Data vi ønsker skal leve etter at containeren er slått av og slettet, må også være konfigurert gjennom volumer.

Fra forrige del-oppgave 3-1 har vi følgende volumer definert:
```
      volumes:
      - ./pg_data:/var/lib/postgresql/data
      - ./workshop-data:/tmp/workshop-data
```
Det første volumet sørger for at data som blir skrevet til PostgreSQL-databasen, også forblir lagret selv om containeren slås av.
Det andre volumet gjør at vi tilgjengeliggjør kurs-data for containeren, slik at vi kan laste disse dataene inn i databasen 

For å utføre denne oppgaven trenger vi nå at postgres-containeren kjører:
`docker compose up -d`

Kjører du kommandoen `docker ps` skal du nå ha 2 containere kjørende. En heter **postgres**, den andre **geoserver**

Nå skal vi koble oss på postgres-containeren og kjøre noen interaktive kommandoer: `docker exec -it postgres /bin/bash`
Denne kommandoen åpner et interaktiv shell (kommando-grensesnitt), slik at vi kan utføre kommandoer.

Utforsk disse kommandoene:
```
which psql
ls /tmp/workshop-data
```
Om alt er på stell, skal du se at vi finner `/usr/bin/psql` som er kommandolinje-klienten for å snakke med PostgreSQL-databasen.
Du vil også se innholdet i mappen workshop-data.

Start psql: `psql -U geoserver -p 5432 -W -h localhost -d geoserver`
Passordet du oppgir, er det samme som du har definert for postgresql i *docker-compose.yml*

Noen nyttige psql-kommandoer:
* `\d` viser relasjoner: schema, navn, type (f.eks view, tabell, sequence) og hvem som har opprettet eller eier.
* `\dn` lister alle database-schemas
* `\dv` lister alle views
* `\dt` lister alle tabeller
* `\q` avslutter psql, men **exit** kan også brukes.

Du skal nå laste inn filen Basisdata_0000_Norge_25833_Kommuner_PostGIS.sql.
` psql -U geoserver -p 5432 -W -h localhost -d geoserver -f /tmp/workshop-data/Basisdata_0000_Norge_25833_Kommuner_PostGIS.sql `
Du må i tillegg legge på en patch, da Postgres-dumpen lastet ned fra Geonorge ikke har definert primærnøkkel (primary key) for tabellene. 

Start psql på nytt (uten `-f`) og sjekk at du har fått et nytt database-schema som er prefikset `kommuner` og eid av bruker `geoserver`
For å liste ut alle tabeller i et bestemt schema kan du kombinere `\dt` og schema-navnet.
`\dt kommuner<tab>`  (psql-klienten har tab-komplettering, så bare du begynner å skrive *kommuner* så finner psql ut av resten)

## 3.3 Legg til PostgreSQL/PostGIS som ny datakilde i Geoserver

* Verifiser at docker containeren kjører: 'docker ps'
* Verifiser at geoserver er operativ ved å åpne nettleseren og gå til [http://localhost:8080/geoserver](http://localhost:8080/geoserver)

Først skal vi lage oss et nytt workspace å lagre våre ting i.
* Under **Data** finner du **Workspaces**, og deretter **Add new workspace**. 
  * Under *navn* gir du verdien `administrativeenheter`, og gjerne la dette være default workspace
  * Under *Namespace URI* legger du verdien `https://sosi.geonorge.no/administrativeenheter`
  * Klikk Save
* I venstre-menyen klikk på **Stores** under **Data**. Velg deretter **Add new Store** og så **PostGIS**.
  * Om du valgte [x] 'Default workspace' i forrige steget, vil du se at 'administrativeenheter' nå dukket opp som forhåndsvalgt workspace.
  * Gi **kommuner** som *Data Source Name*, **Norske kommuner 2025** som *Description* og la den være **enabled**
  * Under oppkoblingsparametre, bruk de samme parametrene du har brukt i docker-compose.yml
    * host: `postgres` NB! bruk container-navnet du har angitt i docker-compose.yml
    * port: `5432`  (NB! *5433* er for hosten utenfor docker. Det interne docker-nettverket bruker vi den interne porten *5432*)
    * database: `geoserver`
    * schema: `kommuner_95b1247e0400454f971d957671dc3744`  Denne er for å si at i dette datastore, skal vi kun se i dette database-schema 
    * user: `geoserver`
    * passwd: (sjekk docker-compose.yml)
    * La **Expose primary keys** være enabled for dette kurs-datasettet

## 3.4 Legg til Kommuner som nytt data layer

Under **Data** og **Layers**, velg **Add new Layer**.
I nedtrekksmenyen skal du finne din kombinasjon av workspace+datastore (administrative:kommuner)
Om du har husket på å laste inn kurs-data, skal du nå få opp 5 potensielle Layers fra datastore kommuner
Klikk *publish* på `kommune`

* Fyll ut etter beste evne, f.eks. gi litt informasjon under *Abstract*.
* Under **Bounding Boxes** klikk på **Compute from native bounds**, så finner Geoserver+Postgres hva de romlige innskrankninger for datasettet Kommuner er for deg.
* Bla deg ned og se hvilke egenskaper og datatyper **Kommune** har (Feature Type Details).
* Scroll til toppen og åpne fanen **Publishing**
  * Scroll deg ned til **OGC API Settings** og klikk **Add link**
  * Rel: `licence`
  * Mime type: `text/html`
  * URL: `https://data.norge.no/nlod`
  * Title: `Norsk lisens for offentlige data (NLOD)`
  * Service: `Features`
  * Klikk **Save**

Du skal nå ha en fungerende OGC API Feature tjeneste tilgjengelig.
http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune

* Data som [HTML](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune/items?f=text%2Fhtml&limit=50)
* Data som [JSON](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune/items?f=application%2Fjson&limit=50)
* Data som [GeoJSON](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune/items?f=application%2Fgeo%2Bjson&limit=50)

## Tilleggsoppgave

Utforsk hvilke [andre lenker](https://docs.geoserver.org/main/en/user/configuration/ogc-api-services/index.html#ogcapi-links) du kan legge til enn lisens
* Enclosure (f.eks. lenke til geonorge-nedlasting)
* describedBy (f.eks. lenke til XML eller HTML metadata på Geonorge)

Om lenken er en html-ressurs, bruk mime type : `text/html`, om det er XML metadata, bruk `application/xml` (maskinlesbar) evt `text/xml` (menneskelesbart)

Neste: [Øving 4](oving-4.md)
