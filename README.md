# dbs

- docker templates for various dbs used at NIRV.ai

## links

- [db rankings](https://db-engines.com/en/ranking)
- [RACExp kanban](https://github.com/orgs/nirv-ai/projects/3)

## About

### db type matrix

|            | rel | doc | mem | graph | key-val | col | wide-col | time | search |
| ---------- | --- | --- | --- | ----- | ------- | --- | -------- | ---- | ------ |
| postgres   | x   |     |     |       |         |     |          |      |        |
| arango     |     | x   |     | x     | x       |     |          |      | x      |
| raven      |     | x   |     |       |         |     |          | x    |        |
| clickhouse |     |     |     |       |         | x   |          | x    |        |
| redis      |     |     | x   |       | x       |     |          |      |        |
| cockroach  | x   |     |     |       |         |     |          |      |        |
| scylla     |     |     |     |       | x       |     | x        |      |        |
| timescale  | x   |     |     |       |         |     |          | x    |        |

### db scalability matrix

|            | nonblockin | async | cache | scale up | scale out | C   | A   | P   |
| ---------- | ---------- | ----- | ----- | -------- | --------- | --- | --- | --- |
| postgres   |            |       |       | x        |           | x   | x   |     |
| arango     |            |       |       | x        | x         | x   |     | x   |
| raven      | x          | x     |       | x        | x         | x   | x   | x   |
| clickhouse |            | x     |       |          | x         | x   |     | x   |
| redis      |            |       | x     | x        | x         |
| cockroach  |            |       |       | x        | x         |
| scylla     | x          | x     | x     | x        | x         |     | x   | x   |
| timescale  |            |       |       |          | x         |

- ravendb: the cluster layer is CP, and the database layer is AP
- cockroach: tho relational, is considered NewSQL as it scales out
