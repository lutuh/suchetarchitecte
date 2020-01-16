#!/bin/bash

# Remove any spaces in the file name.
find . -name "*.jpg" ! -path "*small*" ! -path "*large*"  ! -path "*tiny*" | while read file; do
    rename 's/ /_/g' "$file"
done

find . -name "*.jpg" ! -path "*small*" ! -path "*large*" ! -path "*tiny*" | while read file; do
    echo $file;
    # Create tiny version
    dir=$(dirname $file)
    mkdir -p "tiny/$dir"
    convert -resize 100x "$file" "tiny/$file"
    # Create small version
    dir=$(dirname $file)
    mkdir -p "small/$dir"
    convert -resize 660x "$file" "small/$file"
    # Create large version.
    mkdir -p "large/$dir"
    convert -resize 1920x "$file" "large/$file"
done
