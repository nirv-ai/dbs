# redis

- Redis is an open-source, networked, in-memory, key-value data store with optional durability. It is written in ANSI C. The development of Redis is sponsored by Redis Labs today; before that, it was sponsored by Pivotal and VMware. According to the monthly ranking by DB-Engines.com, Redis is the most popular key-value store. The name Redis means REmote DIctionary Server.

## links

- [dockerhub](https://hub.docker.com/_/redis)
- [security intro](https://redis.io/docs/manual/security/)
- [security acls](https://redis.io/docs/manual/security/acl/)
- [redisInsight](https://docs.redis.com/latest/ri/installing/install-docker/)

## TLDR

```sh
# grab the conf file from the base image
# just copy it from github: https://github.com/redis/redis/tree/7.0/redis.conf

# setup
# ^ check ./redis/* for conf & acls
# ^ you want to use the SHA-256 hash pw feature not the cleartext as used here

# build
docker build -t nirvredis:foss .

# start
#^ via docker run
docker run -d --rm \
  --name nirvredisfoss \
  -p 6379:6379 \
  nirvredis:foss

# ^via docker run with env file
  docker run -d --rm \
    --env-file=./.env \
    --name nirvredisfoss \
    -p 6379:6379 \
    nirvredis:foss

#^ via docker compose
docker compose up -d

#^^ check resulting
docker compose config

# confirm everything is +1
docker logs nirvredisfoss

# ssh to server
docker exec -it nirvredisfoss bash

# ssh into redis
docker exec -it nirvredisfoss redis-cli
AUTH someUserName somePassWord # check ./redis/redis.users.acl
```

## RedisInsight

- RedisInsight is a visual tool that provides capabilities to design, develop and optimize your Redis application. Query, analyse and interact with your Redis data

```sh
# -v redisinsight:/db
docker run -d --rm --net redis_default --name redisgui -p 8001:8001 redislabs/redisinsight:latest
# go to localhost:8001
# set host to redis container: nirvredisfoss
# set name of db to: 0
# enter other info as normal

```
