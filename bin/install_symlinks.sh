#!/usr/bin/env bash

# Print usage if arguments are missing or help is asked for
if [ ${#} -lt 2 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "usage: ./install_symlinks.sh SOURCE_DIR MAJOR.MINOR.PATCH" >&2
  exit 2
fi

# Store arguments
SOURCE_DIR="$1"
VERSION="$2"

# Link modulefiles from modulefiles directory to current working directory
for modulefile in "$SOURCE_DIR/$VERSION"*; do
  if [ ! -f "$modulefile" ]; then
    echo "Skipping '$modulefile' (not a file)"
    continue
  fi

  symlink=$(basename "$modulefile")
  echo "Linking $modulefile to ./$symlink ..."
  ln -s "$modulefile" "$symlink"
done

# Link .modulerc.lua if not yet existing
if [ ! -f ".modulerc.lua" ]; then
  echo "Linking $SOURCE_DIR/.modulerc.lua to ./.modulerc.lua ..."
  ln -s "$SOURCE_DIR/.modulerc.lua" .modulerc.lua
fi
