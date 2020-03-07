#!/bin/bash

re='^[0-9]+([.][0-9]+)?$'

if [ $# -lt 1 ]
then
	echo "help placeholder"
fi

if [ "$1" == "-l" ]
then
find . -name '*.txt' -printf "%f " -exec awk '{ sum += $1 } END{ print sum }' {} \; | sed "s/\.txt//"

elif [ "$1" != "" ] && [ "$2" != "" ] && [[ $2 =~ $re ]]
then
	touch $1.txt
	echo $2 >> $1.txt

elif [ "$2" != "" ] && ! [[ $2 =~ $re ]]
then
	echo "second argument must be a number"

elif [ "$1" != "" ]
then
	touch $1.txt
	awk '{s+=$1} END {print s}' $1.txt
fi

