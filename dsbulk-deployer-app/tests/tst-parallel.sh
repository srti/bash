#!/bin/bash

doit() {
   echo $1
   # Sleep up to 10 seconds
   sleep $((RANDOM*11/32768))
}
export -f doit
parallel -j 10 doit ::: {0..99}