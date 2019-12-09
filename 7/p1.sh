#!/bin/bash

perm() {
    local items="$1"
    local out="$2"
    local i

    [[ "$items" == "" ]] && echo "$out" && return

    for (( i=0; i<${#items}; i++ )); 
    do
      perm "${items:0:i}${items:i+1}" "$out${items:i:1}"
    done
}

max=0

for w in $(perm "01234");
do
    tmp=0

    for i in $(seq 1 ${#w})
    do 
        tmp=$(echo "${w:i-1:1},$tmp" | perl intcode.pl)
    done
    
    if [[ $tmp -ge $max ]]; then max=$tmp; fi
done

echo "Max: $max"