#!/bin/sh

# Check if wp-config.php already exists
if [ -f ./wp-config.php ]
then
	echo "Wordpress already downloaded"
else

	# The latest WordPress release
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	# Replace placeholders in wp-config-sample.php with actual MySQL credentials
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	# Create wp-config.php by copying wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};

fi

# Execute the provided command line arguments (useful for container startup)
exec "$@"
