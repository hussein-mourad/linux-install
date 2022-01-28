#!/bin/bash


# ensure bash shell
if [ ! "$BASH_VERSION" ] ; then
    echo "Please do not use sh to run this script ($0), just execute it directly" 1>&2
    exit 1
fi


# check for user input
if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

# check for vaild file
if [[ ! -e "$1" ]]
  then
    echo "Not a valid filename"
    exit 1
fi

echo Printing even pages of "$1" ......
lpr -o outputorder=reverse -o page-set=even "$1"

read -r -p "Flip the pages......Continue (y/n)?" response
 response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
  lpr -o page-set=odd "$1"
fi


exit 1



