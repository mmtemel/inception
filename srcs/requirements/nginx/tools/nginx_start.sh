#!/bin/bash

# Check if the SSL certificate file does not exist
if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
    echo "Nginx: setting up ssl ...";

    # Generate a self-signed SSL certificate using OpenSSL
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=mtemel.42.fr";

    echo "Nginx: ssl is set up!";
fi

#x509: İmzalı sertifika oluşturur,
#days: Geçerlilik süresini belirler,
#newkey: Yeni RSA anahtarı oluşturur,
#keyout: Anahtar çıktı yolunu belirler,
#out: Sertifika çıktı yolunu belirler,
#subj: Sertifika bilgilerini belirler

# Execute any additional command line arguments (useful for container startup)
exec "$@"