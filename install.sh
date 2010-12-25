#!/bin/sh

for i in *.sh; do
    ln -s $PWD/$i ..
done
