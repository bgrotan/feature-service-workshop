# Øving 5 Innlesing med QGIS 

I denne øvingen skal du gjøre deg kjent med å bruke OGC API Features fra et Desktop GIS.
Du kan i prinsipp selv velge, men oppskriften går ut fra at du har QGIS Desktop installertd

## 5.1 Legg til OGC API Features som server 

Gå til ...

## 5.2 Overstyr paging-størrelsen

Har du et veldig stort datasett som skal lastes inn, kan det være nyttig å fin-tune på antall
objekter du ønsker å rå returnert "pr side". Default er ofte 100, men nå tenker vi at 1000
vil være en fin størrelse. 

### Har du fått alle dataene?

Du må også kunne evaluere om du har fått alle dataene.
Utforsk html-grensesnittet, og finn ut hvor mange objekter det er i det aktuelle datasettet
du ønsker å laste inn, og sette max_antall til et tilstrekkelig høyt tall.

Om du vil, kan du teste ut å lese ut data fra OGC API Features med (python.md).

Neste: Opsjonell [øving med Python](python.md) 
