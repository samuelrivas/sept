#!/bin/sh
#
# Run an escript similar to erl -make everywhere an Emakefile is found

set -e

HOME=$PWD/`dirname $0`

if [ -z "$1" ]; then
    DIRS=`find $HOME -name 'Emakefile' -exec readlink -m '{}'/.. \;`;
else
    DIRS="$1/src";
fi

ERL_LIBS=$HOME:$ERL_LIBS $HOME/sept/emake $DIRS
