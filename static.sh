#!/bin/bash

FILE="example.txt"
EXPECTED_CONTENT="Hello, World!"

# Overwrite the file with expected content
echo "$EXPECTED_CONTENT" > "$FILE"
echo "Updated file $FILE with expected content."
