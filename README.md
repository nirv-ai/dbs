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

|            | nonblockin | async | cache | scale up | scale out |
| ---------- | ---------- | ----- | ----- | -------- | --------- |
| postgres   |            |       |       |          | x         |
| arango     |            |       |       |          | x         |
| raven      | x          | x     |       | x        | x         |
| clickhouse |            |       |       |          | x         |
| memcached  |            |       | x     |          | x         |
| redis      |            |       | x     |          | x         |
| cockroach  |            |       |       | x        | x         |
| scylla     | x          | x     | x     | x        | x         |
| timescale  |            |       |       |          | x         |
