#!/bin/bash
echo "Sleeping waiting for redis"
sleep 20
COUNTER=0
while [  $COUNTER -lt 30 ]; do
    echo "==================================================="
    echo Starting Redis Benchmark Run $COUNTER
    redis-benchmark --csv
    echo Ending Redis Benchmark Run $COUNTER
    echo "==================================================="
    let COUNTER=COUNTER+1
done

