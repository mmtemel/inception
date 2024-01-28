#! /bin/bash

openssl req -newkey rsa:4096 -x509 -sha256 -days 30 -nodes \
    -out $CERT_FILE \
    -keyout $KEY_FILE -subj "/C=TR/ST=KOCAELI/L=IZMIT/O=42 School/OU=mtemel/CN=mtemel.42.fr"

rm -f /etc/nginx/sites-available/default && rm -f /etc/nginx/sites-enabled/default

# req: Sertifika isteği oluşturur.
# -x509: Sertifika formatı. web güvenli iletişim için dijital standarttır.
# -nodes: Sertifika için şifre kullanılmayacağını belirtir.
# rsa:4096: 4096 bitlik bir rsa anahtarı oluşturur.
