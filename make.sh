#!/bin/sh

set -e

HOME=$PWD/`dirname $0`

APPS=
for i in `find $HOME -name ebin`; do
    APPS="${APPS} -pa $i";
done

for i in `find $HOME -name 'src'`; do
    cd $i
    echo "Making `dirname $i | xargs basename`"
    erl -eval 'case make:all([debug_info, {outdir, "../ebin"}]) of error -> halt(1); _ -> halt(0) end.' -noshell ${APPS}
    cd $HOME
done
