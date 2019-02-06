#!/bin/bash

find . -name "*.jpg" ! -path "*small*" | while read file; do
    convert -resize 660x "$file" "small/$file"
done
