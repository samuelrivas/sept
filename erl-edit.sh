#!/bin/sh
#
# Launch emacs with the right ERL_LIBS exported so that flymake finds the
# included headers

ROOT="$( cd "$( dirname "$0" )" && pwd )"

ERL_LIBS=$ROOT:$ERL_LIBS emacs $@