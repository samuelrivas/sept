#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

for i in $DIR/*.sh; do
    ln -fs $i $DIR/..
done
