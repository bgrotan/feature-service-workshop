# Bonus-øving: OGC API Features med Python 

Denne oppgaven krever litt forkunnskaper med Python, og er testet med Python 3.13 

OGC API Features bruker såkalte "Accept-headers" for å dedusere om klienten er en html-basert nettleser 
eller en klient som vil ha maskinlesbare data (som feks. JSON/GeoJSON).

Modulen 'requests' i Python lar deg kjøre GET, POST, PUT, PATCH, DELETE.
Vi skal for enkelhets skyld kun bruke GET-requests, altså det samme som en vanlig nettleser ville brukt.

```
>>> import requests,json
>>> url="http://localhost:8080/geoserver/features/v1/...."

>>> r = requests.get(url)
>>> r.status_code 

# Hvilken tallkode fikk du? 2xx er fint, 3xx betyr at noe har flyttet på seg, 4xx betyr ingen adgang, 5xx server-feil

>>>r.headers['content-type']  

# fikk du text/html eller application/json eller noe annet?

>>> j = json.loads(response.text)

# j er nå en dict (dictionary). Utforsk hvilke nøkler: med j.keys(). 
# Hent ut verdier med j.get("navnpånøkkel")
# Skriv en funksjon eller bare iterer over lenkene i j.get("links"), finn lenken til OpenAPI-spesifikasjonen til tjenesten
```
