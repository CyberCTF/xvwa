# XVWA ships no Dockerfile (upstream: copy the folder into a LAMP web root as /xvwa/). This image
# does that on PHP 5.6 with Apache, the PHP generation XVWA was written for: the source from app/
# goes to /var/www/html/xvwa/, the PHP settings of app/php.ini are loaded, the copied config.php
# points at the db machine (xvwa / xvwa) instead of localhost / root, / redirects to /xvwa/, and
# the command first starts setup-db.sh in the background, which runs XVWA's Setup page once so
# the lab starts ready.
FROM docker.io/library/php:5.6-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY --chown=www-data:www-data app/ /var/www/html/xvwa/
COPY app/php.ini /usr/local/etc/php/conf.d/xvwa.ini
RUN sed -i -e 's/^\$host = .*/$host = "db";/' -e 's/^\$user = .*/$user = "xvwa";/' \
      -e 's/^\$pass = .*/$pass = "xvwa";/' /var/www/html/xvwa/config.php \
 && mkdir -p /var/www/html/xvwa/img/uploads && chown -R www-data:www-data /var/www/html/xvwa \
 && printf '<?php header("Location: /xvwa/");\n' > /var/www/html/index.php

COPY setup-db.sh /usr/local/bin/xvwa-setup-db
CMD ["sh", "-c", "sh /usr/local/bin/xvwa-setup-db & exec apache2-foreground"]
