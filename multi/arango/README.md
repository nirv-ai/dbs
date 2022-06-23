# arangodb

- The database system supports three data models with one database core and a unified query language AQL. The query language is declarative and allows the combination of different data access patterns in a single query.

## links

- [arangodb dockerfile](https://github.com/arangodb/arangodb-docker/tree/official/alpine/3.9.2)
- [docker hub](https://hub.docker.com/_/arangodb/)
- [config options](https://www.arangodb.com/docs/stable/administration-configuration.html)
- refs
  - [arangodb server](https://www.arangodb.com/docs/stable/programs-arangod.html)
  - [arangodb server env vars](https://www.arangodb.com/docs/stable/programs-arangod-env-vars.html)

## TLDR

```sh
# grab the conf file from the base image

# setup

# build
docker build -t nirvarango:foss .

# start
#^ via docker run
docker run -d --rm \
  --name nirvarangofoss \
  -e ARANGO_ROOT_PASSWORD=arango \
  -e ARANGODB_OVERRIDE_DETECTED_TOTAL_MEMORY=1G \
  -p 8529:8529 \
  -v /tmp/arangodb:/var/lib/arangodb3 \
  -v /tmp/arangodb3-apps:/var/lib/arangodb3-apps \
  nirvarango:foss

# ^via docker run with env file
docker run -d --rm \
  --env-file=./.env \
  --name nirvarangofoss \
  -p 8529:8529 \
  nirvarango:foss

#^ via docker compose
docker compose up -d

#^^ check resulting
docker compose config

# confirm everything is +1
docker logs nirvarangofoss

# ssh to server
docker exec -it nirvarangofoss bash

# ssh to db
docker exec -it nirvarangofoss arangosh
```

## Arango Web Admin

- http://localhost:8529
- uname: root
- pw: arango
