#!/bin/bash

# Remove any spaces.
find . -name "*.jpg" ! -path "*small*" | while read file; do
    rename 's/ /_/g' "$file"
done

# Create small version.
find . -name "*.jpg" ! -path "*small*" | while read file; do
    convert -resize 660x "$file" "small/$file"
done
