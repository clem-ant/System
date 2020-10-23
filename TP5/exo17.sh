#!/bin/sh
if [ $# -ne 1 ]
then
	echo "$0 nom_dossier1 : Il faut au moins un dossier en paramètre" >&2
	exit 1
fi
ls -R $1 | grep ":$" | sed -e "1d;s/:$//" | grep -o "[^/]*$"
