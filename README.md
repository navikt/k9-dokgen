[![](https://github.com/navikt/k9-dokgen/workflows/Verify%20and%20test/badge.svg)](https://github.com/navikt/k9-dokgen/actions?query=workflow%3A%22Verify+and+test%22)

# k9-dokgen
Brevmaler for team k9saksbehandling.


## Importer maler i prosjekt

Bruker:

https://github.com/navikt/dokgen

## Scripts

Gjøre scripts kjørbare:
`chmod +x *.sh`

### Deploy
script for å manuelt deploye til miljøene.

Basert på denne: https://doc.nais.io/deployment/manual

### Lokal testing
kjør med spring profilen dev for å aktivere redigering i test:
`SPRING_PROFILES_ACTIVE=dev docker-compose -p dokgen_dev_interactive up --build`

### Up
Enkel test for å se om docker-imaget kan bygges og starter riktig i containeren.
