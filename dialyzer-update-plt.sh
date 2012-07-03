#!/bin/sh
#
# Usage: dialyzer-update-plt.sh [exclude-regexps]
#
# Typically you can run this file without arguments.
#
# exclude-regexps are any number of regular expressions. Any path matching any
# of those expressions will not be analysed.
#
# Some regular expressions are excluded by default, look get-erlang-path escript
# for more information about this
#
# The first time you run this function it will take quite likely a lot of time
# and a lot of resources. Next updates will be much faster and lighter (unless
# you remove the generated plt (which is something that you probably want to
# avoid)

set -e

SEPT_HOME="$( cd "$( dirname "$0" )" && pwd )"

PLT=$SEPT_HOME/sept.plt
ERL_LIBS=$SEPT_HOME/lib
export ERL_LIBS

ALL_LIBS=`$SEPT_HOME/sept/get-erlang-path $@`

dialyzer --add_to_plt --plt $PLT $ALL_LIBS
