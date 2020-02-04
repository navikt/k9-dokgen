#!/usr/bin/env bash

mkdir build/tmp

templatePath="content/templates/"

for file in $templatePath*/ ; do
  if [[ -d "$file" && ! -L "$file" ]]; then
    dir=${file%*/}
    dir=${dir##*/}
    cp $templatePath$dir/schema.json "build/tmp/$dir.json"
  fi;
done