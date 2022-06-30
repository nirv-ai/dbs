FROM redis:7.0.2 as baseredis

EXPOSE 6379

COPY redis/ /usr/local/etc/redis/
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
