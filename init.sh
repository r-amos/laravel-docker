#!/bin/bash
function get_laravel() {
    git clone https://github.com/laravel/laravel
}

function start() {
    docker-compose up -d
}

[[ ! -d laravel ]] &&  get_laravel
cp -r ./docker/. ./laravel

# Tidy Folders
rm -rf docker
rm init.sh
cp -r ./laravel/. . && rm -rf laravel
cp -r . .. && rm -rf ../laravel-docker
chmod  -R 777 ../storage