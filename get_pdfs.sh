#!/bin/bash

echo "Copying..."
# Find & copy
find slides exercises -name "*.pdf" -not -path "*/imgs/*" -exec cp {} . \;
echo "Done."

