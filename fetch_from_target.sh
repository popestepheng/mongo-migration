#!/bin/bash

BACKUP_CMD="mongodump --host $MONGODB_SRC_HOST --db $MONGODB_SRC_DB --out /backup/dump ";


if [ ! -z "$MONGODB_SRC_PORT" ];
then
    BACKUP_CMD="$BACKUP_CMD --port $MONGODB_SRC_PORT ";
fi

if [ ! -z "$MONGODB_SRC_USER" ];
then
    BACKUP_CMD="$BACKUP_CMD --username $MONGODB_SRC_USER ";
fi

if [ ! -z "$MONGODB_SRC_PASSWORD" ];
then
    BACKUP_CMD="$BACKUP_CMD --password $MONGODB_SRC_PASSWORD ";
fi

if [ ! -z "$MONGO_COLLECTIONS" ];
then
    IFS=' ' read -r -a COLLECTIONS <<< "$MONGODB_COLLECTIONS"
    for COLLECTION in "${COLLECTIONS[@]}"
    do
        eval "$BACKUP_CMD -c $COLLECTION";
    done
else
    eval $BACKUP_CMD;
fi