#!/usr/bin/env bash

# Print usage if arguments are missing or help is asked for
if [ ${#} -lt 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "usage: ./install_julia.sh MAJOR.MINOR.PATCH" >&2
  exit 2
fi

# Parse Julia version
if [ -n "$IFS" ]; then
  OIFS="$IFS"
fi
IFS="."
VERSION=($1)
if [ -n "$OIFS" ]; then
  IFS="$OIFS"
fi

# Set umask to create files/folders with sane permissions
umask 022

# Download Julia
BASE_URL="https://julialang-s3.julialang.org/bin/linux/x64"
TARFILE="julia-$1-linux-x86_64.tar.gz"
if [ ! -f "$TARFILE" ]; then
  echo "Downloading Julia..."
  curl -OJL "$BASE_URL/${VERSION[0]}.${VERSION[1]}/$TARFILE"
fi

# Extract and rename
if [ ! -d "$1" ]; then
  echo "Extracting Julia..."
  tar xf "$TARFILE" --mode='g+w'
  mv "julia-$1" "$1"
fi

# Print success
echo "Everything seems to have worked as expected."
echo "Julia $1 has been installed to $(pwd)/$1."
echo "You may remove the tar file by running 'rm $TARFILE'".
