# mongo-migration

This image runs mongodump to backup data from a source mongodb server and database and imports it into a destination mongodb server and database

## Usage:

    docker build -t mongo-migration .
    docker run -d \
        --env MONGODB_SRC_HOST="172.17.0.2" \
        --env MONGODB_SRC_PORT=27017 \
        --env MONGODB_SRC_USER="user" \
        --env MONGODB_SRC_PASSWORD="pass" \
        --env MONGODB_SRC_DB="my-db" \
        --env MONGODB_DEST_HOST="172.17.0.3" \
        --env MONGODB_DEST_PORT=27017 \
        --env MONGODB_DEST_USER="root" \
        --env MONGODB_DEST_PASSWORD="root" \
        --env MONGODB_DEST_DB="my-db-stage" \
        --env MONGODB_COLLECTIONS="projects epics"
        mongo-migration

## Parameters

    MONGODB_SRC_HOST      the host/ip of your source mongo database
    MONGODB_SRC_PORT      the port number of your source mongo database
    MONGODB_SRC_USER      the username of your source mongo database
    MONGODB_SRC_PASSWORD  the password of your source mongo database
    MONGODB_SRC_DB        the database name to dump.
    MONGODB_COLLECTIONS   optional collection names, if set, only these collections will get dumped/imported
    MONGODB_DEST_HOST     the host/ip of your destination mongo database
    MONGODB_DEST_PORT     the port number of your destination mongo database
    MONGODB_DEST_USER     the username of your destination mongo database
    MONGODB_DEST_PASSWORD the password of your destination mongo database
    MONGODB_DEST_DB       the database name to import.
 
