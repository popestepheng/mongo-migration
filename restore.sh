#!/bin/bash

if [ ! -d /backup/dump/$MONGODB_SRC_DB ]; then
    echo "ERROR: No backup done!"
    exit 1;
fi

if [ -z "$MONGODB_COLLECTIONS" ];
then
    ./cleanup.sh
fi

RESTORE_CMD="mongorestore --host $MONGODB_DEST_HOST --db $MONGODB_DEST_DB --drop "

if [ ! -z "$MONGODB_DEST_PORT" ];
then
    RESTORE_CMD="$RESTORE_CMD --port $MONGODB_DEST_PORT ";
fi


if [ ! -z "$MONGODB_DEST_USER" ];
then
    RESTORE_CMD="$RESTORE_CMD --username $MONGODB_DEST_USER ";
fi

if [ ! -z "$MONGODB_DEST_PASSWORD" ];
then
    RESTORE_CMD="$RESTORE_CMD --password $MONGODB_DEST_PASSWORD ";
fi

RESTORE_CMD="$RESTORE_CMD /backup/dump/$MONGODB_SRC_DB";
eval $RESTORE_CMD;