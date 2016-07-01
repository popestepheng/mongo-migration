#!/bin/bash

./check_variables.sh &&
./fetch_from_target.sh &&
./restore.sh &&
echo "All done";