#!/usr/bin/env sh

CONFIG_DIR=/app
CONFIG_FILE=${CONFIG_DIR}/custom-skulls.yml

{
if [ -f ${CONFIG_FILE} ]; then
  echo "${CONFIG_FILE} exists, skipping parse..."
  exit 0
fi
}

set -e

echo "Parsing environment for ${CONFIG_FILE}"
mkdir -p ${CONFIG_DIR}
touch ${CONFIG_FILE}

IFS='
'
echo 'player-usernames:' >> ${CONFIG_FILE}
for username in ${PLAYER_USERNAMES}; do
  echo "  - $(echo ${username} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo 'player-uuids:' >> ${CONFIG_FILE}
for uuid in ${PLAYER_UUIDS}; do
  echo "  - $(echo ${uuid} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo 'player-profiles:' >> ${CONFIG_FILE}
for profile in ${PLAYER_PROFILES}; do
  echo "  - $(echo ${profile} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo 'skin-hashes:' >> ${CONFIG_FILE}
for hash in ${SKIN_HASHES}; do
  echo "  - $(echo ${hash} | xargs echo -n)" >> ${CONFIG_FILE}
done