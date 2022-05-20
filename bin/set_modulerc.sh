#!/usr/bin/env bash

# Print usage if arguments are missing or help is asked for
if [ ${#} -lt 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "usage: ./set_modulerc.sh MAJOR.MINOR.PATCH" >&2
  exit 2
fi

# Get current script directory
# Source: https://stackoverflow.com/a/246128/1329844
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copy dotfile from modulefiles directory to current working directory and adapt version
if [ -f "$SCRIPT_DIR/../modulefiles/$SITE_PLATFORM_NAME/dot-modulerc.lua" ]; then
  echo "Overwriting .modulerc.lua ..."
  cat "$SCRIPT_DIR/../modulefiles/$SITE_PLATFORM_NAME/dot-modulerc.lua" \
    | sed "s/VERSION/$1/" > .modulerc.lua
fi
if [ -f "$SCRIPT_DIR/../modulefiles/$SITE_PLATFORM_NAME/dot-modulerc" ]; then
  echo "Overwriting .modulerc ..."
  cat "$SCRIPT_DIR/../modulefiles/$SITE_PLATFORM_NAME/dot-modulerc" \
    | sed "s/VERSION/$1/" > .modulerc
fi
