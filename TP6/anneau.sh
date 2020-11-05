#!/bin/sh
if [ $# -ne 1 ]
then
	echo "Mauvais nombre de paramètres"
	echo "Forme : $0 [N]"
fi
echo `echo PID : $$`
anneau=$2

for i in $((anneau-1))
do
	command& ./anneau.sh i
done
