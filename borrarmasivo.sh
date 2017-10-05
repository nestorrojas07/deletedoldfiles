#!/bin/bash
#elimina los archivos 
CURRENT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $CURRENT

if [ "$(id -u)" == "0" ]; then
	echo "Sorry, you are root."
	exit -1
fi

if [ "$USER" == "root" ]; then
    echo "el usuario $USER no tiene permiso para ejecutar"
    exit -1
fi

actualDir="$CURRENT/args.txt"
script="$CURRENT/borarfiles.sh"

while IFS= read -r; do
  line=$REPLY
  echo "linea $line"
  IFS=';' read -r -a array <<< "$line"
  sh $script "${array[0]}" "${array[1]}"
done < $actualDir


