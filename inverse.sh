#!/bin/sh

if [ "$#" -ne 1 -a "$#" -ne 2 ]
then
	echo "Erreur : $0 nom_fichier1 [nom_fichier2]" >&2
fi

case $# in
	1 ) nbligne=`wc -l $1|cut -f1 -d ' ' `
		echo Un seul parametre
		echo nombre de ligne : $nbligne;;
	2 ) 
		cp $1 $2
		sh $0 $2;;
esac
