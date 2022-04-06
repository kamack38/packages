#!/bin/bash -

for n in $(find . | grep 'update.sh'); do
    IFS='/' read -r -a array <<<"$n"
    echo "Processing ${array[2]}"
    bash $n
done
