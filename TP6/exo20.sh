#!/bin/sh
trap "echo \nC\'est non, tu ne fermeras pas ce programme" 2
user=`whoami`
pid=`ps -u $user | grep exo20.sh | cut -f3 -d ' '`
while true
do
	echo `date | cut -f5 -d ' '`
	sleep 1
	#echo essai kill SIGINT
	#kill -2 $pid
done
