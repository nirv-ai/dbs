# dbs

- docker templates for various dbs used at NIRV.ai

## links

- [RACExp kanban](https://github.com/orgs/nirv-ai/projects/3)

## About

### db type matrix

|            | rel | doc | mem | graph | key-val | col | row | time | search |
| ---------- | --- | --- | --- | ----- | ------- | --- | --- | ---- | ------ |
| postgres   | x   |     |     |       |         |     |     |      |        |
| arango     |     | x   |     | x     | x       |     |     |      | x      |
| raven      |     | x   |     |       |         |     |     | x    |        |
| clickhouse |     |     |     |       |         | x   |     |      |        |
| memcached  |     |     | x   |       | x       |     |     |      |        |
| redis      |     |     | x   |       | x       |     |     |      |        |
| cockroach  | x   |     |     |       |         |     |     |      |        |
| scylla     |     |     |     |       |         |     | x   |      |        |
| timescale  | x   |     |     |       |         |     |     | x    |        |

### db scalability matrix

|                       | postgres | arango | raven | clickhouse | memcached | redis | cockroach | scylla | timescale |
| --------------------- | -------- | ------ | ----- | ---------- | --------- | ----- | --------- | ------ | --------- |
| nonblockin            |          |        | x     |            |           |       |           | x      |           |
| async                 |          |        | x     |            |           |       |           | x      |           |
| cache                 |          |        |       |            | x         | x     |           | x      |           |
| distributed           |          |        |       |            |           | x     | x         | x      |           |
| scale up (multi core) |          |        | x     |            |           |       | x         | x      |           |
| scale out (shard)     | x        | x      | x     | x          | x         | x     | x         | x      | x         |
