FROM debian:buster

ARG CERT_FILE
ARG KEY_FILE

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openssl nginx

COPY tools/nginx.sh /usr/local/bin/nginx.sh

RUN chmod +x /usr/local/bin/nginx.sh

RUN /usr/local/bin/nginx.sh

COPY conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf


# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#the command run when this container starts
CMD ["nginx", "-g", "daemon off;"]

