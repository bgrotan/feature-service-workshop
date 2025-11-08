# Øving 5 Innlesing med QGIS 

I denne øvingen skal du gjøre deg kjent med å bruke OGC API Features fra et Desktop GIS.
Du kan i prinsipp selv velge, men oppskriften går ut fra at du har QGIS Desktop installertd

## 5.1 Legg til OGC API Features som server 

I **Browser**-vinduet, velg **WFS / OGC API - Features**, høyreklikk og velg "New connection".
* Under Name, skriv `kommuner`
* Under URL, legg inn din adresse: `http://localhost:8080/geoserver/ogc/features/v1/`
* WFS Options:
  * Under Version, velg "OGC API - Features"
  * La "Enabled feature paging" være enablet, og sett *Page size* til f.eks. 100
* Åpne **Data Source Manager** og deretter **WFS/OGC API - Features**
  * Velg din server "kommuner" og klikk **Connect**.
  * Finn datasettene **kommune** og evt **grense**, marker og klikk **Add** 
  * Du vil nå se at kommuner (og grenser) kommer i bolker på 100 til hele datasettet er lest inn
* Under **Layers**, velg "adminsitrativeenheter:kommuner", og deretter klikk på **Identify**-knappen.
  * Klikk deg rundt i kartet, objektet du har truffet blir nå vist i en annen farge, og egenskapene blir vist i en egen resultat-visning.

NB! Enkelte kommersielle GIS-verktøy, har støtte for Paging, men hvor du selv må sette inn max-verdi. 

## 5.2 Overstyr paging-størrelsen

Har du et veldig stort datasett som skal lastes inn, kan det være nyttig å fin-tune på antall
objekter du ønsker å rå returnert "pr side". Default er ofte 100, men er det snakk om mer enn 100.000 objekter, kan 1000 vil være en fin pagesize. 

### Har du fått alle dataene?

Du må også kunne evaluere om du har fått alle dataene.
Utforsk html-grensesnittet, og finn ut hvor mange objekter det er i det aktuelle datasettet
du ønsker å laste inn, og sette max_antall til et tilstrekkelig høyt tall.

Om du vil, kan du teste ut å lese ut data fra OGC API Features med (python.md).

Neste: Opsjonell [øving med Python](python.md) 
