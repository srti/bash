#!/bin/bash
echo "Bootstrap main.sh..."

gBasePath=$(dirname "$0")
source "$gBasePath/common.sh"
source "$gBasePath/common-cql.sh"

function initSync {
    logInfo "init-sync"
    tableExist= && keyspace=videos && table=videos
    tableExist $tableExist $keyspace $table

}

function execAsync {
    logInfo "exec-sync"
}

initSync
execAsync
