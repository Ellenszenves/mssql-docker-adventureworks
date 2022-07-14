#!/bin/bash
download() {
if [[ -f "./AdventureWorks2019.bak" ]]
then
echo "Fájl már letöltve!"
else
wget "https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak"
fi
main
}

run-docker() {
docker build -t advan:1 .
docker run --name adv -d -p 1433:1433 advan:1
}

main() {
  read -p "Indulhat a letöltés?(i/n)" fun
  if [[ $fun == "i" ]]
  then
  download
  else
    read -p "Építsük az image-et?(i/n)" func
    if [[ $func == "i" ]]
    then
    run-docker
    else
    exit
    fi
  fi
}
main
