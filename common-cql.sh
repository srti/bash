#!/bin/bash
gBasePath=$(dirname "$0")
source "$gBasePath/common.sh"

CQLSH_OPTS="--no-color"

function dataExist {
    local sql="select * from $1.$2 limit 10"
    local result=$(docker exec -it dse_dse_1 cqlsh $CQLSH_OPTS -e "$sql" | wc -l)
    #remove spaces
    result=${result// /}
    #remove CR
    result=${result//$'\r'}
    logInfo "dataExist" "Result for table $2 equals $result."
    if [ $result -eq 10 ]; then return 0; else return 1; fi;
} 

function tableExist {
    local sql="select count(*) from system_schema.tables where keyspace_name='$1' and table_name='$2'"
    local result=$(docker exec -it dse_dse_1 cqlsh $CQLSH_OPTS -e "$sql" | awk '{if(NR==4) print}')
    #remove spaces
    result=${result// /}
    #remove CR
    result=${result//$'\r'}
    logInfo "tableExist" "Count for table $2 equals $result."
    if [ $result -gt 0 ]; then return 0; else return 1; fi;
} 

function truncateTable {
    docker exec -it dse_dse_1 cqlsh $CQLSH_OPTS -e "truncate table $1"
} 

function test {
    local keyspace=videodb
    local table=videos

    tableExist $keyspace $table
    echo "tableExist $keyspace $table: $?"
    dataExist $keyspace $table
    echo "dataExist $keyspace $table: $?"
}

test