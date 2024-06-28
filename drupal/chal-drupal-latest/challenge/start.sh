#!/bin/bash

/opt/drupal/vendor/bin/drush php-script /opt/drupal/auth-flag.php > /dev/null 2>&1
/opt/drupal/vendor/bin/drush user:password admin "$PASSWORD" > /dev/null 2>&1

apache2-foreground > /dev/null 2>&1 &

# Proxy stdin/stdout to server
socat - TCP:127.0.0.1:8080,forever

