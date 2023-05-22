#!/bin/bash
set -e

TABLE=restaurants
SQL_EXISTS=$(printf '\dt "%s"' "$TABLE")

#check if database non exist
if /usr/bin/psql -lqtb -h "$POSTGRES_DBHOST" -p "$POSTGRES_PORT" "$POSTGRES_DBNAME" "$POSTGRES_USER" 2>/dev/null | cut -d \| -f 1 | grep -qw $POSTGRES_DBNAME; then
    echo "database exists"
else
    echo "database doesn't exists. Create database via terraform"
    exit 1
fi

if [[ $(/usr/bin/psql -h "$POSTGRES_DBHOST" -p "$POSTGRES_PORT" -d "$POSTGRES_DBNAME" "$POSTGRES_USER" -c "$SQL_EXISTS") ]]; then
    echo "table restaurants exists"
else
    echo "table restaurants doesn't exists. Creating table"
    /usr/bin/psql -v ON_ERROR_STOP=1 -h "$POSTGRES_DBHOST" -p "$POSTGRES_PORT" "$POSTGRES_DBNAME" "$POSTGRES_USER" <<-EOSQL
        \connect "$POSTGRES_DBNAME";
	    CREATE TABLE IF NOT EXISTS restaurants (
    	    name        char(30),
    	    count       integer,
    	    PRIMARY KEY (name)
	    );
	    INSERT INTO restaurants (name, count) VALUES ('outback', 0);
	    INSERT INTO restaurants (name, count) VALUES ('bucadibeppo', 0);
	    INSERT INTO restaurants (name, count) VALUES ('chipotle', 0);
	    INSERT INTO restaurants (name, count) VALUES ('ihop', 0);
EOSQL
fi
