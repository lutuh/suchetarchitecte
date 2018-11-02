#!/bin/bash

for f in static/img/*/*.jpg; do
    echo "$f"
    basedir=$(dirname $f)
    filename=$(basename $f)
    mkdir -p "$basedir/small"
    convert -resize 660x "$f" "$basedir/small/$filename"
    #jpegoptim "$basedir/small/$filename"
done

