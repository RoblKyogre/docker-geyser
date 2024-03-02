#!/usr/bin/env sh

{
if [ -z ${RESOURCE_PACKS} ]; then
  echo "No resource packs defined, skipping..."
  exit 0
fi
}

mkdir -p /tmp/packs
cd /tmp/packs

IFS='
'
for pack in ${RESOURCE_PACKS}
do
  echo "Downloading resource pack: $(echo ${pack} | xargs echo -n)..."
  wget --content-disposition "$(echo ${pack} | xargs echo -n)"
done

mkdir -p /app/packs
mv /tmp/packs/* /app/packs
rm -rf /tmp/packs