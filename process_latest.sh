#!/bin/bash

# config
FILES=$(pwd $0)/formats
GLOBALSH=write_all.sh
# Change this to 'lehd' to finalize
[[ -z $1 ]] && BRANCH=master || BRANCH=$1
case $BRANCH in
    lehd-deploy|LEHD-DEPLOY)
        VERSION=official
        ;;
    *)
        VERSION=lehd
        ;;
esac

# find latest
[[ -z $2 ]] && latest=$(cd formats; ls -1d * | grep -E "V[0-9]" | tail -1) || latest=$2

# diagnostics
echo "========================================="
echo "Processing $latest with output=$VERSION"
echo "========================================="

# do stuff
cd $FILES/$latest
./$GLOBALSH $VERSION
