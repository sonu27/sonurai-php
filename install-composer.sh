#!/bin/sh
set -e

curl -o composer-setup.php https://getcomposer.org/installer
curl -o composer-setup.sig https://composer.github.io/installer.sig

php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) !== trim(file_get_contents('composer-setup.sig'))) { unlink('composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php composer-setup.sig
