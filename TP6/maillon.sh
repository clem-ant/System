#!/bin/sh
if [ $# -ne 2 ]
then
	echo "Mauvais nombre de paramètres"
	echo "Forme : $0 [M] [PID_SUIVANT]"
fi
anneau=$2
