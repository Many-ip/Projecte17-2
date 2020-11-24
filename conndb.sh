#!/bin/bash
nomscript=$0 # $0 es el nom del programa

PORTDB=3306
function usage(){
cat << EFO
Usage: $nomscript [-u usuari] [-h hostname] [-p port] [-t]
   -u   usuari de la base de dades (obligatori)
   -h   hostname on es connectarà (obligatori
   -p   port (no obligatori ja que per defecte és 3306, però si existeix ha de ser un numero superior a 1024 i inferior o igual a 65535)
   -t   no es connecta,  només comprova connexió
EFO
}

while getopts ":u:h:p:t" o; do
#echo "OPTIND: $OPTIND OPTARG: $OPTARG"
case "${o}" in
u)
   USERDB=$OPTARG
;;

h)
  HOSTDB=$OPTARG
;;

p)
  PORTDB=$OPTARG
  if [ $PORTDB -lt 1204 ] || [ $PORTDB -gt 65535 ] 
  then
	usage
	exit 1
  fi	
;;

t)
  CONN="$HOSTDB:$PORTDB"
  nc -vz $HOSTDB $PORTDB >&/dev/null
  if [ $? -eq 0 ]	 
    then
        echo "PORT is open. Test if this port is mysql"
    else
    echo "PORT is close" 
    exit 1
fi
;;

\?)
echo "ERROR: Invalid option -$OPTARG" 1>&2
echo 
usage
exit 1
;;

:)
            echo "ERROR: Option -$OPTARG requires an argument"
            usage
            ;;
esac
done
shift $((OPTIND-1))
if [ -z "${HOSTDB}" ] || [ -z "${USERDB}" ]
then usage 
fi
