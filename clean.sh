#!/bin/bash

# Insired by code for param loop and interactive code from:
# http://linuxcommand.org/lc3_wss0120.php

remove(directory) 
{
    for filename in /directory; do
        if [[ $filename == *"~"* ]]; then
            rm $filename
        fi
        if [[ $filename == *"~"* ]]; then
            rm $filename
        fi           
    done
}

statistics()
{

}
##################################################################
##                              Main                            ##
##################################################################
params=false 
# initially check if there are command line arguments
if [ $# -gt 0 ]; then
    # If there are check for parameters
    echo "Your command line contains $# arguments"
    params=true
else
    # if there aren't run default program
    echo "Your command line contains no arguments"
    params=false
fi

# Param loop
if [ "$params" =  true]; then
    interactive=
    quiet=false
    statistics=false
    directory=$1                    shift

    while [ "$1" != "" ]; do
        case $1 in
            -f | --file )           shift
                                    directory=$1
                                    ;;
            -i | --interactive )    interactive=1
                                    ;;
            -s | --stats )          statistics=true
                                    ;;
            -s | --quiet )          quiet=true
                                    exit
                                    ;;
            * )                     exit 1
        esac
        shift
    done
fi

# Code for interactive mode
if [ "$interactive" = "1" ]; then

    response=

    echo -n "Enter name of directory [$directory] > "
    read response
    if [ -n "$response" ]; then
        directory=$response
    fi

    if [ -f $directory ]; then
        echo -n "Output file exists. Overwrite? (y/n) > "
        read response
        if [ "$response" != "y" ]; then
            echo "Exiting program."
            exit 1
        fi
    fi
fi

# Test code to verify command line processing

if [ "$interactive" = "1" ]; then
	echo "interactive is on"
else
	echo "interactive is off"
fi
echo "output file = $directory"
