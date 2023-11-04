#!/usr/bin/env bash

chemin_fichier=$1
count=1

#break if the directory of file is not given
if [ -z "$1" ]; then
  echo "Veuillez donner le chemin du fichier à lire."
  exit 1
fi

#read file line by line; output order number, website URL, HTTP response code and encoding
while read -r line;
do
	lien_url=$line
	#fetch encoding of website
	web_encodage=$(curl -s "$lien_url" | grep -Eo 'charset=".*"' | cut -d'"' -f2)
	web_response=$(curl -Ils "$lien_url" | grep "HTTP/" | grep -Eo "[0-9]{3}")
	echo -e "$count\t${line}\t$web_response\t$web_encodage"
	count=$((count+1))
done < "$chemin_fichier"