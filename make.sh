#!/bin/sh
#
# Run erl -make in all erlang apps

set -e

HOME=$PWD/`dirname $0`

if [ -z "$1" ]; then
    DIRS=`find $HOME -name 'src'`;
else
    DIRS="$1/src";
fi

for i in $DIRS; do
    cd $i
    echo
    echo "\033[32mMaking `dirname $i | xargs basename`\033[0m"
    ERL_LIBS=$HOME:$ERL_LIBS erl -eval \
	'case make:all([debug_info, {outdir, "../ebin"}]) of error -> halt(1); _ -> halt(0) end.' \
	-noshell
    cd $HOME
done
