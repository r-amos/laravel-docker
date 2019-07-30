#!/bin/bash
function get_laravel() {
    git clone https://github.com/laravel/laravel
}

function start() {
    docker-compose up -d
}

function tidy() {
    rm -rf docker
    rm init.sh
    cp -r ./laravel/. . && rm -rf laravel
    cp -r . .. && rm -rf ../laravel-docker
}

function init() {
    get_laravel
    cp -r ./docker/. ./laravel
    tidy
    chmod  -R 777 ../storage
}

init
