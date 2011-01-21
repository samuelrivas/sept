#!/bin/sh
#
# Start a shell with the code path set to load all erlang apps in the project

ROOT=$PWD/`dirname $0`
APPS=
for i in `find ${ROOT} -name ebin`; do
    APPS="${APPS} -pa $i";
done

erl ${APPS} $@