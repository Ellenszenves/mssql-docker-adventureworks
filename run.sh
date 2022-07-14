#!/bin/bash
wget "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak"
main
run-docker() {
docker build -t advan:1 .
}
main() {
  read -p "Építsük az image-et?" func
  if [[ $func == "i" ]]
  then
  run-docker
  else
  exit
  fi
}
