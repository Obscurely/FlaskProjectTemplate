#!/usr/bin/env bash

# Use wget to fetch the HTML content from the URL
html_content=$(wget -qO- https://cdn.jsdelivr.net/npm/alpinejs@latest/dist/cdn.min.js)

# Extract the version number from the HTML content using grep and regular expressions
live_version=$(echo "$html_content" | grep -oE 'version:"[0-9]+\.[0-9]+\.[0-9]+"')

# Read the contents of a file into a variable called file_contents
file_contents=$(<./frontend/static/src/alpine.js)

# Extact the version number from the local htmx file using grep and and regular expressions
local_version=$(echo "$file_contents" | grep -oE 'version:"[0-9]+\.[0-9]+\.[0-9]+"')

# Compare the version number with the contents of the file
if [ "$live_version" == "$local_version" ]; then
    echo "Alpine.js live and local versions match. No need for upgrading."
else
    echo "Alpine.js live and local versions don't match. Upgrade is needed!!!"
    echo "Local version: $local_version"
    echo "Live version: $live_version"
    echo "Run: ./scripts/get_latest_htmx.sh to upgrade."
fi
