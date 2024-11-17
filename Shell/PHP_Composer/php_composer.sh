#!/bin/bash

# This command automatically installs PHP Composer
php composer-setup.php --install-dir=bin --filename=composer
# This command moves php composer to usr/local/ directory
mv composer.phar /usr/local/bin/composer
