#!/usr/bin/env bash
## Setter context først... denne skal feile om du ikke er logget inn
kubectl config use-context dev-fss
kubectl get applications | grep k9-dokgen
if [[ $? == 1 ]]
then
echo "Skru opp navtunellen"
exit
fi

## Litt environment stuff
mkdir -p tmp
npm install -g mustache
brew install jq

## Setter noen variabler
RELEASE_VERSION=$(git log -1 --pretty='%ad' --date=format:'%Y%m%d%H%M')_$(git log -n 1 --pretty=format:'%h')
IMAGE_NAME=docker.pkg.github.com/navikt/k9-dokgen/k9-dokgen

## Forbereder deploy delen... greit å gjøre dette først om noe skulle feil.
cp ./nais/dev-fss.json ./tmp/vars.json
cat ./tmp/vars.json | jq --arg team teamtag '. + {team: $team}' | tee ./tmp/vars.json
cat ./tmp/vars.json | jq --arg version $IMAGE_NAME:$RELEASE_VERSION '. + {version: $version}' | tee ./tmp/vars.json
mustache ./tmp/vars.json ./naiserator.yaml > ./tmp/naiserator.yaml

## Hvis man er logget inn i Github skal dette gå som en lek.
docker build -t $IMAGE_NAME:$RELEASE_VERSION .
docker push $IMAGE_NAME:$RELEASE_VERSION
if [[ $? == 1 ]]
then
echo "Får ikke pushet til github"
exit
fi

## Gjennomfører en deploy
kubectl apply -f ./tmp/naiserator.yaml --wait
kubectl rollout status -w deployment/k9-dokgen
