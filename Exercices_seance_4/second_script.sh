#!/bin/bash

type_entite=$1

if [ -z "$type_entite" ]; then
	echo "Veuillez préciser le type d'entité."
	exit

else

	chmod +x Nb_occurence_type.txt
	
	for ANNEE in 2016 2017 2018
	do
		./Nb_occurence_type.txt $ANNEE $type_entite
	done
fi