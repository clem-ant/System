#!/bin/sh

affichage_menu()
{
	echo "-------------------------\nVous pouvez taper une commande Unix, ou bien :\nfin si vous souhaitez quitter l'appllication\nrelancer n si vous souhaitez relancer les n dernières commandes\nVotre choix :"
}

relancer_n()
{
	for i in $(seq 1 $1);
	do
		echo i = $i
		`tail -n $i temp|head -1`
	done
}
affichage_menu
while read "$"choix var1
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
			$choix $var1 && echo $choix $var1 >> temp
	esac
	affichage_menu
done

