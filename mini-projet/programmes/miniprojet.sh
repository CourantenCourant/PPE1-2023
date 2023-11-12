#!/usr/bin/env bash

chemin_fichier=$1
count=1

#break if directory of file is not given
if [ -z "$1" ]; then
  echo "Veuillez donner le chemin du fichier à lire."
  exit 1
fi

#read file line by line; output order number, website URL, HTTP response code and encoding
while read -r line;
do
	#fetch encoding of websites
	web_encodage=$(curl -s "$line" | grep -Eo 'charset=".*"' | cut -d'"' -f2)
	#fetch HTTP response code from websites
	web_response=$(curl -Ils "$line" | grep "HTTP/" | grep -Eo "[0-9]{3}")
	echo -e "$count\t${line}\t$web_response\t$web_encodage"
	count=$((count+1))
done < "$chemin_fichier"