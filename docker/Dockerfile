FROM alpine/git as git
WORKDIR /app
RUN git clone https://github.com/laravel/laravel.git

FROM composer as vendor
COPY --from=git /app/laravel/database/ database/
COPY --from=git /app/laravel/composer.json composer.json
RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

FROM ubuntu:18.04
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php7.3-fpm \
    php7.3-BCMath \
    php7.3-Ctype \
    php7.3-JSON \
    php7.3-Mbstring \
    php7.3-MySQL \
    php7.3-PDO \
    php7.3-Tokenizer \
    php7.3-XML \
    nginx \
    netcat \
    vim && \
    apt-get -y purge --remove software-properties-common && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* temp/* /var/temp/* && \
    mkdir /run/php && \
    mkdir -p /var/www/webroot/ROOT/public && \
    sed -i -e 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=git /app/laravel/. /var/www/webroot/ROOT
COPY --from=vendor /app/vendor/ /var/www/webroot/ROOT/vendor
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod -R 777 /var/www/webroot/ROOT/storage
EXPOSE 80
WORKDIR /var/www/webroot/ROOT
CMD /etc/init.d/php7.3-fpm start && nginx -g "daemon off;"
