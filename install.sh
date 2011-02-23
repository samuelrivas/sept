#!/bin/sh

HOME=$PWD/`dirname $0`

for i in $HOME/*.sh; do
    ln -fs $i $HOME/..
done
