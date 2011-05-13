#!/bin/sh
#
# Run an escript similar to erl -make in every xxx/src directory

set -e

SEPT_HOME=$PWD/`dirname $0`

if [ -z "$1" ]; then
    DIRS=`find $SEPT_HOME -maxdepth 2 -name 'src' -exec readlink -m '{}' \;`;
else
    DIRS="$1/src";
fi

ERL_LIBS=$SEPT_HOME:$ERL_LIBS $SEPT_HOME/sept/emake $DIRS
