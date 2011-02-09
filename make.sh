#!/bin/sh
#
# Run erl -make in all erlang apps

set -e

HOME=$PWD/`dirname $0`

APPS=
for i in `find $HOME -name ebin`; do
    APPS="${APPS} -pa $i";
done

if [ -z "$1" ]; then
    DIRS=`find $HOME -name 'src'`;
else
    DIRS="$1/src";
fi

for i in $DIRS; do
    cd $i
    echo "Making `dirname $i | xargs basename`"
    erl -eval 'case make:all([debug_info, {outdir, "../ebin"}]) of error -> halt(1); _ -> halt(0) end.' -noshell ${APPS}
    cd $HOME
done
