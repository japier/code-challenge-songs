# Code Challenge Songs

The finality of this challenge is to test the skills to get a project and increase it's functionality


## Pre-requisites

* Docker
* Golang 1.12+


## Setup the Database

First we need to setup our database, for that we will the docker image of timescaledb

* Run timescaledb image with docker (Replace default_password by a more secure password)

`docker run -d --name timescaledb -p 5432:5432 -e POSTGRES_PASSWORD=default_password timescale/timescaledb:2.1.0-pg13`

The default user for this container is `postgres` but it can be replaced with the env variable POSTGRES_USER

For more information [here](https://docs.timescale.com/install/latest/installation-docker/) is the docker timescaledb documentation

* Connect with a psql client and create a new database

`psql -h localhost -p 5432 -U postgres -c 'CREATE DATABASE songs'`

* Restore the database from the songs.sql file

`psql -h localhost -p 5432 -U postgres -d songs < songs.sql`

That should create and restore the songs database

* After that we test that the database was created

`psql -h localhost -p 5432 -U postgres songs -c 'select id, name from songs limit 1'`

it should see something similar to:

`                 id                  |     name
--------------------------------------+--------------
 973d7631-7225-4f09-a4a3-57f963d67a17 | Silver Bells
(1 row)
`

## Configuring credentials
