#!/bin/bash

for i in $@
  do
    /usr/bin/xdg-open $i &
  done
