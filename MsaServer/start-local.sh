#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <config-file>"
    exit 1
fi

./msa-server -local -config $1
