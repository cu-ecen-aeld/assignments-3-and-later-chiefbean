#!/bin/sh

# Check if arguments exist and if directory exists, if not, create directory
if [ -z "$1" ]; then
    echo "ERROR: Not enough arguments specified"
    exit 1
elif [ -z "$2" ]; then
    echo "ERROR: Not enough arguments specified"
    exit 1
elif [ ! -d "$(dirname "$1")" ]; then
    mkdir -p "$(dirname "$1")"
fi

# Write WRITESTR to file
echo "$2" > "$1"

# Handle exit code if write operation failed
if [ "$?" -ne "0" ]; then
    echo "ERROR: Could not write '$2' to file '$1'"
    exit 1
fi