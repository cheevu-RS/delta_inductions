#!/bin/bash
find $1 -type f -atime -14 -size 0 > t.txt
while read -r line
do
    name="$line"
    rm "$name"
done < t.txt

