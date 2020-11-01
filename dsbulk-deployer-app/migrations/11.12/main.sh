#!/bin/bash
echo "Bootstrap main.sh..."

gBasePath=$(dirname "$0")
source "$gBasePath/../../common/common.sh"
source "$gBasePath/../../common/common-cql.sh"

function initSync {
    logInfo "initSync"
    local keyspace=videodb && local table=videos
    tableExist $keyspace $table

}

function execAsync {
    logInfo "execSync"
}

initSync
execAsync
