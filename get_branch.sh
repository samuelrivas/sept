#!/bin/sh
#
# Print app branches and last commit

DIR=`dirname $0`
PWD=`cd $DIR; pwd`
cd $PWD
for i in *; do
    if [ -d $i ]; then
	cd $i
	RESULT=`git branch 2> /dev/null | grep "^\*" | cut -d ' ' -f2`
 	if [ ! -z "$RESULT" ]; then
	    echo "\033[31m${RESULT}\033[0m $i";
	fi
	cd ..
    fi
done
