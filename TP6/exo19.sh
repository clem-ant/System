#!/bin/sh
user=`whoami`
echo Detaillees :
ps -f -u $user
echo -----------------------
echo Tres detaillees
ps -l -u $user

echo ----------------------
gnome-terminal -e firefox
echo Ouverture de Firefox
sleep 3
nbpros=`ps -A | grep firefox | wc -l`
pid=`ps -u $user | grep firefox | cut -f4 -d ' '`
kill $pid
echo Kill de firefox
echo Le nombre de processus issue de la commande firefox est : $nbpros
