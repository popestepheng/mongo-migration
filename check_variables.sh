#!/bin/bash
#source
if [ -z "$MONGODB_SRC_HOST" ];
then
    echo "ERROR: Please set MONGODB_SRC_HOST variable";
    exit 1;
fi

if [ -z "$MONGODB_SRC_DB" ];
then
    echo "ERROR: Please set MONGODB_SRC_DB variable";
    exit 1;
fi

#destination
if [ -z "$MONGODB_DEST_HOST" ];
then
    echo "ERROR: Please set MONGODB_DEST_HOST variable";
    exit 1;
fi

if [ -z "$MONGODB_DEST_PORT" ];
then
    echo "ERROR: Please set MONGODB_DEST_PORT variable";
    exit 1;
fi

if [ -z "$MONGODB_DEST_DB" ];
then
    echo "ERROR: Please set MONGODB_DEST_DB variable";
    exit 1;
fi