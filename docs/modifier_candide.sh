#!/usr/bin/env bash

fichier=$1
# cat "$fichier" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr '\n' ' ' | tr -s ' ' | tr ' ' '\n' > mod_candide.txt
cat "$fichier" | ggrep -P -o '\w+' | tr '[:upper:]' '[:lower:]' > mod_candide1.txt

: <<'END'
On peut aussi utiliser :
ggrep -P -o '\w+'
\w est une expression régulière qui matche tous les caractères (numériques ou alphabétiques).

Pour vérifier que l'argument existe :
if [ ! -f "$1" ];
then
    echo "Pas de fichier donné en argument !"
    exit 1
fi
-f vérifie que c'est un fichier.
END