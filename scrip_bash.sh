#!/bin/bash

# Verificar url 
if [ -z "$1" ]; then
  echo "Uso: $0 URL"
  exit 1
fi

URL=$1

# Verificar si la URL  contiene un dominio
if [ -z "$DOMAIN" ]; then
  DOMAIN=$(echo "$URL" | sed -e 's/^https\?:\/\///' -e 's/\/.*//')
fi

# Tomar el dominio si existe 
DOMAIN=$(echo "$URL" | awk -F[/:] '{print $4}')


# Realizar la solicitud HTTP y procesar la salida
curl -s "$URL" --compressed |
grep -o 'href="[^"#]*"' |
awk -v domain="$DOMAIN" -F '"' '{
  if ($2 !~ /^http/ && $2 !~ /^\/\//) 
    print "https://" domain $2; 
  else if ($2 ~ /^\/\//) 
    print "https:" $2;
  else 
    print $2
}' |
sort |
uniq -u
