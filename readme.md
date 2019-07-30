# Laravel Docker

Simple Laravel Development Environment.

## Install

Create a new project directory, clone and run the initialization:

```bash
mkdir project-name && cd project-name
git clone git@github.com:r-amos/laravel-docker
cd laravel-docker
./init.sh
```

Edit `docker/docker-compose.yaml` as required.

## Useage

Once installed, run `docker-compose` in the project directory to spin up:

```bash
cd project-name
docker-compose up -d
```

Will create the following containers:
- `laravel` application
- `db` database 
- `queue` queue worker
- `redis` queue

Visit `localhost`