# Use the Debian Buster base image
FROM debian:buster

# Update package list and install Nginx and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Create a directory for SSL configurations
RUN mkdir /etc/nginx/ssl

# Copy custom Nginx configuration file to the default sites-enabled directory
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

# Copy a script for starting Nginx to /var/www/
COPY ./tools/nginx_start.sh /var/www

# Give execute permissions to the Nginx start script
RUN chmod +x /var/www/nginx_start.sh

# Create a directory for Nginx runtime files
RUN mkdir -p /run/nginx

# Set the entry point for the container to execute the Nginx start script
ENTRYPOINT ["var/www/nginx_start.sh"]

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Set the default command to run when the container starts (start Nginx in daemon off mode)
CMD ["nginx", "-g", "daemon off;"]
