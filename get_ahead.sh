#!/bin/sh
#
# Print the list of git repositories that are ahead upstream

DIR=`dirname $0`
PWD=`cd $DIR; pwd`
cd $PWD
for i in *; do
    if [ -d $i ]; then
	cd $i
	RESULT=`git branch -v 2> /dev/null | grep '\[ahead.*\]'`
	if [ ! -z "$RESULT" ]; then
	    echo "\033[31mAHEAD\033[0m $i";
	fi
	cd ..
    fi
done
