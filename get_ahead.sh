#!/bin/sh
#
# Print the list of git repositories that are ahead upstream

DIR=`dirname $0`
PWD=`cd $DIR; pwd`
cd $PWD
for i in *; do
    if [ -d $i ]; then
	cd $i
	RESULT=`git branch -v | grep ahead`
	if [ ! -z "$RESULT" ]; then
	    echo "AHEAD:$i";
	fi
	cd ..
    fi
done
