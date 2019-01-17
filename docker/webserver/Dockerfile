FROM ubuntu:18.04

RUN apt-get update && apt-get install -y apache2
RUN apt install -y mysql-client
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php libapache2-mod-php php-mysql php-mbstring php-xml
RUN apt-get install -y nginx

WORKDIR "/application"

RUN chmod -R 755 /application/

COPY ./apache/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache/apache2.conf /etc/apache2/apache2.conf
COPY ./apache/ports.conf /etc/apache2/ports.conf
RUN a2enmod rewrite
RUN service apache2 restart

COPY ./nginx/vhost.conf /etc/nginx/sites-available/default

CMD /usr/sbin/nginx && /usr/sbin/apache2ctl -D FOREGROUND
