#!/bin/bash

# setup the dbs you need
# create user(s) with appropriate perms
# revoke perms from appropriate user(s)

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	REVOKE CREATE ON SCHEMA public FROM PUBLIC;

	CREATE DATABASE appdb WITH OWNER $POSTGRES_USER;
	\connect appdb
	CREATE SCHEMA appdb;
	REVOKE ALL ON DATABASE appdb FROM PUBLIC;


	CREATE ROLE readonly;
	GRANT USAGE ON SCHEMA appdb TO readonly;
	GRANT CONNECT ON DATABASE appdb TO readonly;
	GRANT SELECT ON ALL TABLES IN SCHEMA appdb TO readonly;
	ALTER DEFAULT PRIVILEGES IN SCHEMA appdb GRANT SELECT ON TABLES TO readonly;

	CREATE ROLE readwrite;
	GRANT USAGE ON SCHEMA appdb TO readwrite;
	GRANT USAGE, CREATE ON SCHEMA appdb TO readwrite;
	GRANT CONNECT ON DATABASE appdb TO readwrite;
	GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA appdb TO readwrite;
	ALTER DEFAULT PRIVILEGES IN SCHEMA appdb GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
	GRANT USAGE ON ALL SEQUENCES IN SCHEMA appdb TO readwrite;
	ALTER DEFAULT PRIVILEGES IN SCHEMA appdb GRANT USAGE ON SEQUENCES TO readwrite;

	CREATE USER appuser WITH PASSWORD 'secretpassword';
	GRANT readonly TO appuser;

	CREATE USER appadmin WITH PASSWORD 'secretpassword';
	GRANT readwrite TO appadmin;

	GRANT ALL PRIVILEGES ON DATABASE appdb TO $POSTGRES_USER;
EOSQL
