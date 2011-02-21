#!/bin/sh
#
# Print the list of git repositories that are ahead their svn/trunk

DIR=`dirname $0`
PWD=`cd $DIR; pwd`
cd $PWD
for i in *; do
    if [ -d $i ]; then
	cd $i
	RESULT=`git diff --shortstat HEAD..trunk 2> /dev/null`
	if [ ! -z "$RESULT" ]; then
	    echo "\033[31mAHEAD SVN\033[0m $i";
	fi
	cd ..
    fi
done

