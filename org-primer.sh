#!/bin/bash


# ------------------------------------------------------------------
# FUnctions

DEFAULT_ORG_FILE=org-primer.org

usage() {
    echo $0 usage
    echo $0 [--help|--cleanup] [org-file]
    echo
    echo org-file default to $DEFAULT_ORG_FILE
}

# ------------------------------------------------------------------
# Options

while :
do
    if [ -z "$1" ]; then
	break
    fi


    case "$1" in
	-sh_trace)
	    set -x
	    shift
	    ;;
	
	--cleanup)
	    rm -f tmp/*
	    shift
	    ;;
	

	-\?|--help)
	    usage
	    exit 2
	    ;;

	

	*)
	    break
	    ;;
    esac
done


# ------------------------------------------------------------------
# main

if [ -z "$1" ]; then
    file=$DEFAULT_ORG_FILE
else
    if [ ! -f $1 ]; then
	echo No such file $1 - expect on of $(ls -1 *.org)
	exit 1 
    fi
    file=$1
fi    

emacs -q -l demo-init.el $file


