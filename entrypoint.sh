#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm -F -O 2>&1 \
    | sed -u 's/WARNING.*stdout://' 2>&1 \
    | sed -u -E 's/^[^"{]+"//' 2>&1 \
    | sed -u -E 's/"$//' 2>&1 "$@"
fi

exec "$@"
