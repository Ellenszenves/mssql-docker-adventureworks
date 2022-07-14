#!/bin/bash
wget "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak"

run-docker() {
docker build -t advan:1 .
}

main() {
  read -p "Építsük az image-et?(i/n)" func
  if [[ $func == "i" ]]
  then
  run-docker
  else
  exit
  fi
}
main
