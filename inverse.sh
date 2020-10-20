#!/bin/sh

if [ "$#" -ne 1 -a "$#" -ne 2 ]
then
	echo "Erreur : $0 nom_fichier1 [nom_fichier2]" >&2 
fi

case $# in
	1 )	nbligne=`wc -l $1|cut -f1 -d ' '`
		echo Un seul parametre
		echo nombre de ligne\(s\) : $nbligne
		while [ $nbligne -ne 0 ]
		do
			if [ "$#" -eq 2 ]
			then
				echo ligne : $nbligne
				echo "ligne $nbligne : `head -n $nbligne $1|tail -1`" >> .inv1
				tail -1 .inv1 >> .inv2
				
			else
				echo ligne : $nbligne
				echo "ligne $nbligne : `head -n $nbligne $1|tail -1`" >> .inv1
				tail -1 .inv1 >> .inv2

			fi
			nbligne=$((nbligne-1))
		done
		rm .inv1
		rm .inv2
		
		
#	2 ) cp $1 $2
#		sh $0 $2;;
esac
