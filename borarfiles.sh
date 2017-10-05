#!/bin/bash
#elimina los archivos 

if [ $# -ne 2 ] ; then
    echo "la forma correcta de usar el comando es  "
    echo "sh $0 </path/to/folder/> <diasAntiguedad>" 
    exit -1
fi

if [ ! -d "$1" ]; then
    echo "la carpeta no existe $1"
    exit -2
fi

if [ "$2" -le "0" ]; then
    echo "el numero de dias $2 debe ser mayor a 0"
    exit -3
fi

if [ "$1" == "/" ]; then
    echo "no esta permitido usar $1 como path"
    exit -4
fi

vuid=`id -u`
echo "el usuario actual es $vuid"
#busca los archivos en un directorio $1 tipo archivo del mismo directorio y que pertenezcan al mismo usuario que corre el script
find $1 -mtime +$2  -type f -uid $vuid -maxdepth 0 -print0

echo "se van a borrar los archivos con mas de $2 dias de la carpeta $1"


