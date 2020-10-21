#!/bin/sh

affichage_menu()
{
	echo "-------------------------\nVous pouvez taper une commande Unix, ou bien :\nfin si vous souhaitez quitter l'appllication\nrelancer n si vous souhaitez relancer les n dernières commandes\nVotre choix :"
}

relancer_n()
{
	for i in $(seq 1 $1);
	do
		`grep '^[0-9] :' temp|tail -n $i|head -1 | cut -f2 -d ":"`
	done
}
affichage_menu
index=0
while read choix var1
do
	case $choix in
		fin ) 
			if [ -e temp ]
			then
				rm temp
			fi
			echo Vous quittez le script
			break;;
		relancer ) 
			echo vous relancez les $var1 dernieres commandes
			relancer_n $var1;;
		* )
			$choix $var1 && echo $index : $choix $var1  >> temp && $choix $var1 >> temp
	esac
	affichage_menu
	index=$((index+1))
done
