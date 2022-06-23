# postgres

## links

- [docker-library postgres](https://github.com/docker-library/postgres)
- [dockerize postgres](https://docs.docker.com/samples/postgresql_service/)
- [docker postgres readme](https://hub.docker.com/_/postgres/)

## TLDR

```sh
# grab the conf file from the base image
docker run -i --rm postgres:14.4 cat /usr/share/postgresql/postgresql.conf.sample > postgresql.conf

# setup
# ^ check the initdb script, which provides sensible defaults
sudo chmod +x ./docker-entrypoint-initdb.d/000-runthisfile.sh

# build
docker build -t nirvpg:foss .

# start
#^ via docker run
docker run -d --rm \
  --name nirvpgfoss \
  -e PG_PASSWORD=postgres \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -e POSTGRES_DB=postgres \
  -e POSTGRES_HOST_AUTH_METHOD=scram-sha-256 \
  -e POSTGRES_INITDB_ARGS=--auth-host=scram-sha-256 \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -p 5432:5432 \
  nirvpg:foss

# ^via docker run with env file
  docker run -d --rm \
    --env-file=./.env \
    --name nirvpgfoss \
    -p 5432:5432 \
    nirvpg:foss

#^ via docker compose
docker compose up -d

#^^ check resulting
docker compose config

# confirm everything is +1
docker logs nirvpgfoss

# ssh to server
docker exec -it nirvpgfoss bash

# ssh to db
docker exec -it nirvpgfoss psql \
  -U postgres \
  -d postgres
```

## dbeaver

- nothing unusual; just create a new db connection and add info
