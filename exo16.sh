#!/bin/sh

affichage_menu()
{
	echo "Vous pouvez taper une commande Unix, ou bien :\nfin si vous souhaitez quitter l'appllication\nrelancer n si vous souhaitez relancer les n dernières commandes\nVotre choix :"
}
affichage_menu
until [ $choix -ne fin ]
do
	echo $choix
	case $choix in
		fin ) if [ -e temp ]
			then
				rm temp
			fi
			echo Vous quittez le script
			break;;
		Unix ) 
	esac
done
