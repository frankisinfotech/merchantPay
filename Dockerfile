FROM httpd

WORKDIR /var/www/html

COPY . .

CMD [ "tail", "-f", "/dev/null" ]
