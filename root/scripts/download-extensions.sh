#!/usr/bin/env sh

mkdir -p /tmp/extensions
cd /tmp/extensions

IFS='
'
for extension in ${EXTENSIONS}
do
  wget --content-disposition "${extension}"
done

mkdir -p /app/extensions
mv /tmp/extensions/* /app/extensions
rm -rf /tmp/extensions