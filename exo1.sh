#!/bin/sh

while [ $# -ne 0 ]
do
	if [ -f "$1" -a -r "$1" ]
	then
		cat $1
	else
		echo \<$1\> inaccessible >&2
	fi
	shift
done
