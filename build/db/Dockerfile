# The database XVWA expects (upstream: a local MySQL, database xvwa), as MariaDB 10.11 with the
# values baked in: XVWA connects as xvwa / xvwa to the xvwa database (set in build/xvwa/Dockerfile).
FROM docker.io/library/mariadb:10.11
ENV MARIADB_ROOT_PASSWORD=xvwa-root \
    MARIADB_DATABASE=xvwa \
    MARIADB_USER=xvwa \
    MARIADB_PASSWORD=xvwa
