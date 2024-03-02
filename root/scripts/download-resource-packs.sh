#!/usr/bin/env sh

mkdir -p /tmp/packs
cd /tmp/packs

IFS='
'
for pack in ${RESOURCE_PACKS}
do
  wget --content-disposition "${pack}"
done

mkdir -p /app/packs
mv /tmp/packs/* /app/packs
rm -rf /tmp/packs