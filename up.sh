#!/usr/bin/env bash
docker compose -p dokgen_dev_interactive up -d --build

export HEALTHCHECK_URL=dokgen:8080/actuator/health
export NETWORK_NAME=dokgen_dev_interactive_default
attempt_counter=0
max_attempts=15

if [[ $(uname -m) == *"arm64"* ]]; then
    PLATFORM_FLAG="--platform linux/amd64"
else
    PLATFORM_FLAG=""
fi

printf 'Waiting for server         '
until $(docker run --rm $PLATFORM_FLAG --network $NETWORK_NAME appropriate/curl --output /dev/null --silent --head --fail $HEALTHCHECK_URL); do
    if [ ${attempt_counter} -eq ${max_attempts} ];then
      echo "Max attempts reached, failing"
      exit 1
    fi
    printf '.'
    attempt_counter=$(($attempt_counter+1))
    sleep 2
done
printf ' done'

