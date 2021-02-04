#!/usr/bin/env bash

TEMPLATE_PATH="./content/templates"
SCHEMA_NAME_FINDER_REGEX="^.\/content\/templates\/(.*)\/schema.json$"
DESTINATION_ROOT="build/tmp/"

find $TEMPLATE_PATH -name schema.json | while read schema_path;
do
  destination=$DESTINATION_ROOT$(echo "$schema_path" | sed -n -E "s/$SCHEMA_NAME_FINDER_REGEX/\1.json/p")
  echo "src: $schema_path dest: $destination"
  mkdir -p $(dirname "$destination") && cp "$schema_path" "$destination"
done
