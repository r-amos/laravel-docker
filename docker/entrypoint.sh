#!/bin/bash

DATABASE_HOST=db

function create_environment_file() {

    if [[ ! -f .env ]]; then 
        cp .env.example .env
    fi

}

function initialize_app() {

    if [[ $(cat .env | grep ^APP_KEY=.| wc -l) == 0 ]]; then
        php artisan key:generate
        php artisan migrate
    fi

}

function cache_configuration() {

    php artisan config:cache

}

function wait_for_it() {

    until nc -z -v -w30 ${DATABASE_HOST} 3306
    do
        sleep 5
    done

}

function start_services() {

    /etc/init.d/php7.3-fpm start
    nginx -g "daemon off;"

}

function init_app {

    wait_for_it
    create_environment_file
    initialize_app
    cache_configuration
    start_services

}

function init_queue {
    /etc/init.d/php7.3-fpm start
    cache_configuration
    php artisan queue:listen --queue="${1}"
}

if [[ "${IS_QUEUE}" == true ]]; then
    init_queue "${QUEUE}"
else
    init_app
fi