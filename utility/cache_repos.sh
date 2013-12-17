#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: cache_repos.sh labno REPO_NAME"
    exit 1
fi

SCRATCH_DIR="scratch"
ORG=`ptyhon -c 'import sys; sys.path.append(".."); import config; print(config.getOrgName())'`

mkdir -p $SCRATCH_DIR

cd $SCRATCH_DIR

git clone git@github.com:${ORG}/${2}

cd ${2}

git bundle create ${2}.bundle master
zip ${SCRATCH_DIR}${1}_cache.zip ${2}.bundle

cd ${SCRATCH_DIR}; rm -rf ${2}

