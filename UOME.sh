#!/bin/bash

if [ $# -lt 1 ]; then
	printf "help placeholder"
fi

if [ "$1" != "" ]; then
	touch $1.txt
	echo $2 >> $1.txt
fi
	
