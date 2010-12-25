#!/bin/sh

APPS=
for i in `find . -name ebin`; do
    APPS="${APPS} -pa $i";
done

erl ${APPS}