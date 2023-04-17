#!/bin/bash

echo "Run the first script"
./scripts/test_connection.sh 2>&1 | sed 's/^/test_connection: /'

echo "Run the second script"
./scripts/upload.sh 2>&1 | sed 's/^/upload: /'

echo "Run the third script"
./scripts/download.sh 2>&1 | sed 's/^/download: /'
