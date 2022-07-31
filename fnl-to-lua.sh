#!/usr/bin/env bash

fnl_file=$1
lua_file=$(echo $fnl_file | sed "s/fnl/lua/g")

lua_dir=$(dirname $fnl_file | sed "s/fnl/lua/g")

if [[ ! -d $lua_dir ]]; then
  mkdir -p $lua_dir
fi

fennel --compile $fnl_file > $lua_file
