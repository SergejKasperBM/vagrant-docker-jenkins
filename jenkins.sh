#!/bin/sh
# `/sbin/setuser jenkins` runs the given command as the user `jenkins`.
# If you omit that part, the command will be run as root.
exec /usr/local/bin/run >>/var/log/memcached.log 2>&1