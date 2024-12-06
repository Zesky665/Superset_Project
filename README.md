# Superset_Project

This repo is a simple demonstration of how to set up and use Superset for BI, using a Postgres database and a public dataset.

## Setup

1. Make sure you have docker and docker-compose installed. You can do this using the [instructions](https://docs.docker.com/engine/install/) on the official website.

2. Run the docker container. In the repo root directory run the following command.
```
docker compose up -d
```

You can now see the containers in your Docker Desktop UI. 

Once all of the containers are up and running you can navigate to the Superset interface at [localhost:8080](http://localhost:8080/).

There you will be asked to set up a Superset user and add in a database connection. The credentials for the database can be found in the docker-compose file. 

## Shutting down

To shut down the docker-containers run the following command. 
```
docker compose stop
```

To delete the containers and remove all the stored data run the following.
```
docker compose down -v 
```

