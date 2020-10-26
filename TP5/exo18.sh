#!/bin/sh

#faire ceci avec des grep et des sed est possible mais pas sous la bonne forme du TP
#ls -R $1 | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/+/|/'
#Qui donne
#   . 
#   |-TEST
#   |---FILS1
#   |-----S_FILS11
#   |-----S_FILS12
#   |-------SS_FILS121
#   |-----S_FILS13
#   |-------SS_FILS131
#   |-------SS_FILS132
#   |---FILS2
#   |-----S_FILS21
#   |---FILS3
#   |-----S_FILS31
#ou : tree -Fd  --charset ascii  TEST/ | sed -e "s/\`/+/" -e "s/|-/+-/"


if [ $# -ne 1 ]
then
	echo "$0 nom_dossier1 : Il faut au moins un dossier en paramètre" >&2
	exit 1
fi

occ=0
search() {
for dir in `ls`
do 
	if [ -d $dir ]
	then
		if [ $1 -eq "1" ]
		then 
			echo -n +-
		elif [ $1 -gt "1" ]
		then
			while [ $occ -ne $1 ]
			do
				echo -n "| "
				occ=$((occ+1))
			done
			echo -n +-
		fi
		echo $dir
		cd $dir
		occ=0
		v=$1
		v=$((v+1))
	fi
done
cd ..
v=$((v+1))
}

