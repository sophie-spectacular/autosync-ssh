#!/bin/bash

while true; do
    ./scripts/sync_to.sh
    ./scripts/sync_from.sh
    sleep 120
done
