#!/bin/sh

for i in *; do
    if [ -d $i ]; then
	cd $i;
	echo "Updating $i"
	git pull;
	cd ..;
    fi
done
