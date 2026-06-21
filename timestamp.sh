#!/usr/bin/env bash

FILE="$1"

# Get file modification time in ISO 8601 format
MODIFIED=$(date -r "$FILE" '+%Y-%m-%dT%H:%M:%S%:z')

# Replace the date line in-place
sed -i "s/^date = .*/date = ${MODIFIED}/" "$FILE"
