# Use the Debian Buster base image
FROM debian:buster

# Update package list and install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server

# Expose port 3306 for MariaDB
EXPOSE 3306

# Copy custom MariaDB server configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy tools directory to /var/www/
COPY ./tools /var/www/

# Start the MariaDB server, execute SQL script, and remove the script
RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

# Set the default command to run when the container starts (start mysqld)
CMD ["mysqld"]
