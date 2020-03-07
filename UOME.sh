#!/bin/bash

re='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# -lt 1 ]
then
	printf "usage: UOME [options] [person_name] [amount]\n  options:\n    -l		       Lists all amounts owed by all persons\n,    -l person_name     Lists all transactions for a person\n, note: if a number is negative that means you owe them the amount\n"
fi

if [ "$1" == "-l" ] && [ "$2" == "" ]
then
	find . -name '*.txt' -printf "%f " -exec awk '{ sum += $1 } END{ print sum }' {} \; | sed "s/\.txt//"

elif [ "$1" == "-l" ] && [ "$2" != "" ]
then
	cat $2.txt

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

