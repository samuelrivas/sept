#!/bin/sh

set -e

HOME=`pwd`

APPS=
for i in `find . -name ebin`; do
    APPS="${APPS} -pa $i";
done

for i in `find . -name 'src'`; do
    cd $i
    echo "Making $i"
    erl -eval 'case make:all([debug_info, {outdir, "../ebin"}]) of error -> halt(1); _ -> halt(0) end.' -noshell ${APPS}
    cd $HOME
done

