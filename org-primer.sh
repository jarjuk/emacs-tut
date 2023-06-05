#!/bin/bash


if [ -z "$1" ]; then
    file=org-primer.org
else
    if [ ! -f $1 ]; then
	echo No such file $1 - expect on of $(ls -1 *.org)
	exit 1 
    fi
    file=$1
fi    

emacs -q -l demo-init.el $file


