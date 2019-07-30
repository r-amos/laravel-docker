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
- `laravel` application container
- `db` database container
- `queue` queue worker container
- `redis` queue container

```bash
cd project-name
docker-compose up -d
```

Visit `localhost`.