#!/bin/bash

# config
FILES=$(pwd $0)/formats
GLOBALSH=write_all.sh
# Change this to 'lehd' to finalize
[[ -z $1 ]] && VERSION=draft || VERSION=$1

# find latest
latest=$(cd formats; ls -1d * | grep -E "V[0-9]" | tail -1)

# diagnostics
echo "========================================="
echo "Processing $latest with output=$VERSION"
echo "========================================="

# do stuff
cd $FILES/$latest
./$GLOBALSH $VERSION
