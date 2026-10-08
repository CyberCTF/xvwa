#!/bin/sh
# admin / admin logs in, which proves the database was set up at start.
set -e
jar=$(mktemp)
curl -fsS -c "$jar" -b "$jar" -o /dev/null --data "username=admin&password=admin" http://xvwa/xvwa/login.php
page=$(curl -fsS -c "$jar" -b "$jar" http://xvwa/xvwa/)
echo "$page" | grep -q "Logout"
