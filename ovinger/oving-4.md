# Øving 4 HTML og JSON

I denne øvingen skal du gjøre deg kjent med HTML- og JSON-grensesnittene som OGC API Features tilbyr.

## 4.1 Filtre og paginering 
Gjenbruk docker-compose.yml fra øving 3 

**Spørring**
* Features-API har innebygget støtte for å finne hvilke egenskaper man kan spørre/filtrere på. 
* Sjekk ut [Queryables](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune/queryables?f=text%2Fhtml)

**Paging**
* Features-APIet har innebygget "paging", dvs at ikke alle objekter vil bli returnert med en gang.
* Dette sparer serveren for unødvendig belastning, samtidig som at klienten (nettsiden eller qgis f.eks.) vil få data raskere, men må spørre flere ganger for å få alt.

Undersøk [HTML og JSON-responsene](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:kommune/items), eksperimenter med parametre for å få flere/færre objekter
og hvordan du kan navigere deg til neste "side"/"page" med data.

## 4.2 Lag tegneregel for kommunegrenser

På [Geonorge](https://register.geonorge.no/kartografi/files/Details?SystemId=ca6c1dc8-b3d5-431b-a7c1-3425a87c38a2) register for Digital kartografi
finner du tegneregler for kommunegrenser. Vis/last ned SVG-filen for kommunegrenser og åpne den i en tekst-editor.

Linjefarge for kommunegrenser (stroke) er #8a3e4e og linjetykkelse (stroke-width) er 2

I Geoserver, under **Data**, åpne **Styles**. Opprett ny **Style*, med navn `kommune_grense` og workspace `administrativeenheter` og format `SLD`
``` 
<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld"
    xmlns:sld="http://www.opengis.net/sld"
    xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:gml="http://www.opengis.net/gml"
    version="1.0.0">
  <NamedLayer>
    <Name>kommune_grense</Name>
    <UserStyle>
      <FeatureTypeStyle>
        <Rule>
          <Title>Kommunegrense</Title>          
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#8a3e4e</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">2 1</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>        
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
```

Klikk  **Valider** før du klikker **Save** for å lagre.
Du kan også forhåndsvise hvordan stylen vil bli, ved å klikke på **Preview legend**

Gå tilbake til **Layers** og publiser datasettet `grense` fra workspace `administrativeenheter`.
Velg *compute from bounds* som sist, og under **Publishing** velger du den nye tegneregelen `administrativeenheter:kommune_grense`

* HTML [Map preview](http://localhost:8080/geoserver/wms/reflect?FORMAT=application%2Fopenlayers&LAYERS=administrativeenheter%3Agrense)
* Data [HTML](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:grense/items?f=text%2Fhtml&limit=50)
* Data [JSON](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:grense/items?f=application%2Fjson&limit=50)
* Data [GeoJSON](http://localhost:8080/geoserver/ogc/features/v1/collections/administrativeenheter:grense/items?f=application%2Fgeojson&limit=50)

## 4.3 Overstyr HTML-rendring

Om du ikke vil ha standard utseende på html-responsen, kan du lage din egne grafiske profil.
Geoserver bruker Freemarker som template-motor, både for WMS-tjenester og for OGC API Features.

Om du vil, sjekk ut [HTML Templates](https://docs.geoserver.org/main/en/user/services/features/templates.html).
Geoserver bruker Freemarker Template Engine for html-rendring, så om du vil dykke ned i detaljene kan det være lurt
å sette seg inn i [Freemarker](https://freemarker.apache.org/).

Neste: [Øving 5](oving-5.md)
