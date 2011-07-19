#!/bin/sh
#
# Create a tarball to distribute an application

set -e

APP=$1

if [ -z "$1" ]; then
    echo
    echo "Usage: $0 application"
    echo
    exit 1
fi

APP=`basename $APP`
cd $APP

VERSION=`git describe --always --tag`
TARNAME="$APP-$VERSION"

tar cfj ../$TARNAME.tar.bz2 --exclude .git --exclude "*~" --transform "s,^,$TARNAME/," *

echo "Created $TARNAME.tar.bz2"
