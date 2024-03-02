#!/usr/bin/env sh

{
if [ -z ${EXTENSIONS} ]; then
  echo "No extensions defined, skipping..."
  exit 0
fi
}

mkdir -p /tmp/extensions
cd /tmp/extensions

IFS='
'
for extension in ${EXTENSIONS}
do
  echo "Downloading extension: $(echo ${extension} | xargs echo -n)..."
  wget --content-disposition "$(echo ${extension} | xargs echo -n)"
done

mkdir -p /app/extensions
mv /tmp/extensions/* /app/extensions
rm -rf /tmp/extensions