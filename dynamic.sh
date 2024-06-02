#!/bin/bash

FILE="example.txt"
EXPECTED_CONTENT="Hello, World!"

# Check if the file exists
if [ -f "$FILE" ]; then
	# Check if the content matches
	if grep -qF "$EXPECTED_CONTENT" "$FILE"; then
    	echo "File $FILE already exists with expected content."
	else
    	# Update file content
    	echo "$EXPECTED_CONTENT" > "$FILE"
    	echo "Updated file $FILE with expected content."
	fi
else
	# Create the file
	echo "$EXPECTED_CONTENT" > "$FILE"
	echo "Created file $FILE with expected content."
fi

