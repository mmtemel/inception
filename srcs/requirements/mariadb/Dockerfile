# Use the Debian Buster base image
FROM debian:buster

# Update package list and install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server

# Expose port 3306 for MariaDB
EXPOSE 3306

# Copy custom MariaDB server configuration file
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/start.sh /start.sh

ENTRYPOINT ["sh", "start.sh"]
