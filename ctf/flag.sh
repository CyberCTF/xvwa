#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) in the table flags of the
# xvwa database, where the SQL injection modules reach it;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-xvwa}'
flag=$(printf '%s' "${CTF_FLAG_MAIN:-$dev}" | sed "s/'/''/g")
i=0; until mariadb -h127.0.0.1 -uroot -pxvwa-root -e 'SELECT 1' xvwa >/dev/null 2>&1; do i=$((i+1)); [ $i -gt 150 ] && exit 1; sleep 2; done
mariadb -h127.0.0.1 -uroot -pxvwa-root xvwa -e "CREATE TABLE IF NOT EXISTS flags (flag VARCHAR(255) NOT NULL); DELETE FROM flags; INSERT INTO flags (flag) VALUES ('$flag');"
