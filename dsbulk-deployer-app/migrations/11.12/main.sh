#!/bin/bash
echo "Bootstrap main.sh..."

gBasePath=$(dirname "$0")
source "$gBasePath/../../common/common.sh"
source "$gBasePath/../../common/common-cql.sh"

function test {
    logInfo "initSync"
    local keyspace=videodb && local table=videos
    tableExist $keyspace $table

}

function execAsync {
    echo $1
}

export -f execAsync
parallel -j 10 execAsync ::: ./exec-async/*
