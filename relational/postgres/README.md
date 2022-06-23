# postgres

## links

- [docker-library postgres](https://github.com/docker-library/postgres)
- [dockerize postgres](https://docs.docker.com/samples/postgresql_service/)
- [docker postgres readme](https://hub.docker.com/_/postgres/)

## TLDR

```sh

# build
docker build -t nirvpg:foss .

# start
docker run -d --rm \
  --name nirvpgfoss \
  -e PG_PASSWORD=mysecretdbpw \
  -e POSTGRES_DB=nirv \
  -e POSTGRES_PASSWORD=mysecretpw \
  -e POSTGRES_USER=mysecretuser \
  -p 5432:5432 \
  nirvpg:foss

# ssh
docker exec -it nirvpgfoss psql \
  -U mysecretuser \
  -d nirv
```

## dbeaver

- nothing unusual; just create a new db connection and add info
- ubuntu: had to d/l the postgres driver first, but it doesnt it automatically
