#!/usr/bin/env bash

URL="$1"
FILE="$2"

# Get the title of a YouTube video from its URL
title=$(curl -Ls "$URL" | grep -o '<meta name="title" content="[^"]*"' | sed 's/.*content="//; s/"$//')

# Escape ampersand in the title for use in sed
escaped_title=$(printf '%s\n' "$title" | sed 's/[&|]/\\&/g')

# Update the watchingText and watchingUrl lines in the specified file
sed -i \
    -e "s|^watchingText = .*|watchingText = \"$escaped_title\"|" \
    -e "s|^watchingUrl = .*|watchingUrl = \"$1\"|" \
    "$2"