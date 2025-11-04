# Øving 4 HTML og JSON

I denne øvingen skal du gjøre deg kjent med HTML- og JSON-grensesnittene som OGC API Features tilbyr.

## 4.1 Gjenbruk docker-compose.yml fra øving 3 

Features-API har innebygget "paging", dvs at ikke alle objekter vil bli returnert med en gang.

Dette sparer serveren for unødvendig belastning, samtidig som at klienten (nettsiden eller qgis f.eks.)
vil få data raskere, men må spørre flere ganger for å få alt.

Undersøk HTML og JSON-responsene, eksperimenter med parametre for å få flere/færre objekter
og hvordan du kan navigere deg til neste "side"/"page" med data.

## 4.2 Overstyr HTML-rendring

Om du ikke vil ha standard utseende på html-responsen, kan du lage din egne grafiske profil.
Geoserver bruker Freemarker som template-motor, både for WMS-tjenester og for OGC API Features.

Om du vil ...

Neste: [Øving 5](oving-5.md)
