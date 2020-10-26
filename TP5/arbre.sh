#!/bin/sh

if [ $# -ne 1 ]
then
	echo "$0 nom_dossier1 : Il faut au moins un dossier en paramètre" >&2
	exit 1
fi

tree -Fd  --charset ascii  $1/ | sed -e "s/\`-/+/" -e "s/|-/+/"

