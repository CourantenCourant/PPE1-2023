#!/usr/bin/env bash

nom_fichier=$1
nombre_mot=$2

# "uniq -c" precede precede each line with the count of occurrences. "sort -n" means numeric, "-r" means reverse order.
cat "$nom_fichier" | sort | uniq -c | sort -rn > temp.txt

if [ -z "$nombre_mot" ]; then
    nombre_mot=25
fi 

head -n "$nombre_mot" temp.txt
rm temp.txt