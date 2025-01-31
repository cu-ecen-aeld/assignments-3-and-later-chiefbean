#!/bin/sh

# Check to make sure required arguments exist and directory exists
if [ -z "$1" ]; then
    echo "ERROR: Not enough arguments specified"
    exit 1
elif [ -z "$2" ]; then
    echo "ERROR: Not enough arguments specified"
    exit 1
elif [ ! -d "$1" ]; then
    echo "ERROR: Directory '$1' does not exist"
    exit 1
fi

# Init count variables
count_lines=0
count_files=0

for i in "$1"/*; do
    # Find files containing FINDSTR and count the number of lines
    out=$(grep "$2" "$i" | wc -l)

    # Check if any matching lines were found
    if [ "$out" -gt 0 ]; then
        # Add 1 to count of files and number of lines to count of lines
        count_files=$(( $count_files + 1 ))
        count_lines=$(( $count_lines + $out ))
    fi
done

echo "The number of files are $count_files and the number of matching lines are $count_lines"