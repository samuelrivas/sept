#!/bin/sh

ROOT=$PWD/`dirname $0`
APPS=
for i in `find ${ROOT} -name ebin`; do
    APPS="${APPS} -pa $i";
done

erl ${APPS}