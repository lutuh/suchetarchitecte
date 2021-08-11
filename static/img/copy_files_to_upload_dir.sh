#!/bin/bash

find . -mindepth 2 -name "*.jpg" | egrep -v "(upload|large|small|tiny)" | while read filepath; do
  dir=$(basename $(dirname $filepath))
  file=$(basename $filepath)
  # https://stackoverflow.com/questions/14390955/how-to-echo-x-y-in-bash-script
  cp "$filepath" "upload/${dir}_${file}"
done