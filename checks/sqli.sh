#!/bin/sh
# The SQL injection module lists the coffee products from the database.
set -e
page=$(curl -fsS --data "item=&search=Affogato" http://xvwa/xvwa/vulnerabilities/sqli/)
echo "$page" | grep -q "Affogato"
