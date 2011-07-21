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

# git show --oneline doesn't seem to be working, so we use git log to annotate
# the downloaded version
git log --oneline | head -n1 > GIT_VERSION

tar cfj ../$TARNAME.tar.bz2 --exclude .git --exclude "*~" --transform "s,^,$APP/,S" *

rm GIT_VERSION

echo "Created $TARNAME.tar.bz2"
