#!/bin/sh
#
# Start a shell with the code path set to load all erlang apps in the project

ROOT=$PWD/`dirname $0`
ERL_LIBS=$ROOT:$ERL_LIBS erl $@