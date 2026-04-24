#!/usr/bin/env sh

set -e

for SCRIPT_FILE in $(find /scripts -type f -print)
do
	${SCRIPT_FILE}
done

cd /data
exec java ${JVM_OPTS: } -jar /Geyser.jar $@
