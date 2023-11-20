#!/usr/bin/env bash

#Create a file with one word per line.
cat candide.txt | ggrep -P -o '\w+' | tr '[:upper:]' '[:lower:]' > word_per_line.txt

#Create a bigramme file.
echo ' ' > temp1.txt
cat word_per_line.txt >> temp1.txt
paste temp1.txt word_per_line.txt > bigramme.txt

nombre_mot=$1

#Count bigrammes.
cat bigramme.txt | sort | uniq -c | sort -rn > sorted_bigramme.txt

#Set $nombre_mot to 25 if value not given.
if [ -z "$nombre_mot" ]; then
    nombre_mot=25
fi 

#Show $nombre_mot number of most frequent bigrammes.
head -n "$nombre_mot" sorted_bigramme.txt

#Remove all temporary files.
rm word_per_line.txt temp1.txt bigramme.txt sorted_bigramme.txt