#!/bin/sh
#
# Run an escript similar to erl -make in every xxx/src directory or every
# directory passed as argument
#
# If the environment variable EMAKE_STRICT is set, warnings are treated as
# errors

set -e

SEPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

if [ -z "$1" ]; then
    DIRS=`find $SEPT_HOME -maxdepth 2 -name 'src' -exec readlink -m '{}' \;`;
else
    DIRS="$@";
fi

ERL_LIBS=$SEPT_HOME:$ERL_LIBS $SEPT_HOME/sept/emake $DIRS
