#!/bin/sh
#
# Start a shell with the code path set to load all erlang apps in the project

ROOT="$( cd "$( dirname "$0" )" && pwd )"

ERL_LIBS=$ROOT:$ERL_LIBS erl $@