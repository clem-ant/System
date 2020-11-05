#!/bin/sh

if [ $# -ne 1 ]
then
	echo "$0 nom_dossier1 : Il faut au moins un dossier en paramètre" >&2
	exit 1
fi

pwd
ls -R $1 | grep ":$" | sed -e 's/:$//' -e 's/^/       /' -e 's/[^\/]*\//--/g' -e 's/^/       /' -e 's/-/|/'
# 1er sed: remove colons
# 2nd sed: replace higher level folder names with dashes
# 3eme sed: indent graph three spaces
# 4eme sed: replace first dash with a vertical bar
if [ `ls -F -1 | grep "/" | wc -l` -eq 0 ]   # Verifie qu'il y a bien des fichiers
   then echo "   -> no sub-directories"
   fi
echo
exit
