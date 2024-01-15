#!/bin/bash

if [ -n "$1" ]
then
  docker build -t vectorinfo/postfix:$1 .
else
  echo "Usage: $0 <tag>"
fi
