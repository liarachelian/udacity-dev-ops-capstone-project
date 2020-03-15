FROM brettt89/silverstripe-web

ENV MYSQL_DATABASE='test'
ENV MYSQL_USER='root'

WORKDIR /var/www/

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
#RUN php -r "unlink('composer-setup.php');"
#RUN composer create-project silverstripe/installer /var/www/html
#COPY /app/.env /var/www/html/.env


EXPOSE 80
EXPOSE 443
