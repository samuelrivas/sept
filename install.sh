#!/bin/sh

for i in *.sh; do
    ln -fs $PWD/$i ..
done
