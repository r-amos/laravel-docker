#!/bin/bash
function get_laravel() {
    git clone https://github.com/laravel/laravel
}

function start() {
    docker-compose up -d
}

[[ ! -d laravel ]] &&  get_laravel
chmod -R 777 ./laravel/storage
cp -r ./docker/. ./laravel
rm -rf docker
rm init.sh