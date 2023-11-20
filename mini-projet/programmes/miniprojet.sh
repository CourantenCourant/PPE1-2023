#!/usr/bin/env bash

chemin_fichier=$1
count=1

#Give a default file if chemin_fichier not specified
if [ -z "$1" ]; then
	chemin_fichier="../urls/fr.txt"
fi

#Read file line by line; output order number, website URL, HTTP response code and encoding
while read -r line;
do
	#Fetch encoding of websites
	web_encodage=$(curl -s "$line" | grep -Eo 'charset=".*"' | cut -d'"' -f2)
	#Fetch HTTP response code from websites
	web_response=$(curl -Ils "$line" | grep "HTTP/" | grep -Eo "[0-9]{3}")
	echo -e "$count\t${line}\t$web_response\t$web_encodage" >> temp.txt
	count=$((count+1))
done < "$chemin_fichier"

#Give HTML head, create HTML file
echo -e "
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Mini-projet</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
	</head>
	<table>
		<tr><th>Numéro</th><th>Site</th><th>Réponse_HTTP</th><th>Encodage</th></tr> 
	<body>" > miniprojet.html

#Read temp.txt line by line, convert each line to a HTML body line
while read -r line;
do
#Convert each line to HTML body
mod_line=$(echo -e "$line" | sed 's/\t/<\/td><td>/g')
echo -e "
		<tr>
			<td>${mod_line}</td>
		</tr>" >> miniprojet.html
done < temp.txt

#Give HTML end
echo "
	</body>
	</table>
</html>" >> miniprojet.html

#Remove temporary files
rm temp.txt

: <<'END'
On peut écrire :
echo "<html>
	<head>
		<meta charset=\"UTF-8\">
	</head>
	<body>"
\" pour déspécialiser

echo "		<table>
			<tr><th>ligne</th><th>URL</th><th>code HTTP</th><th>encodage</th></tr>"

echo "		<table>


END