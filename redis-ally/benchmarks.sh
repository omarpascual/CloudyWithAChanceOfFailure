#!/bin/bash
# Original benchmarks
#echo "Sleeping waiting for redis"
sleep 5
#COUNTER=0
#while [  $COUNTER -lt 30 ]; do
#    echo "==================================================="
#    echo Starting Redis Benchmark Run $COUNTER
#    redis-benchmark --csv
#    echo Ending Redis Benchmark Run $COUNTER
#    echo "==================================================="
#    let COUNTER=COUNTER+1
#done
# Run Redis benchmark against redis1 container.
#    -q: quiet
#    -c: 15 clients
#    -t: benchmark 'ping', 'set' and 'get' (others ...)
#    -d: data is 50 bytes
#    -r: keyspace of 10000 keys
#    -n: request 30000 operations
#    --csv: output in CSV format

# one from the paper.
HOST=127.0.0.1
PORT=6379
RUNS=$(seq 1 20 )
CONNECTIONS="1 2 3 4 5 10 15 20 30 40 50"

echo "[DBG] Start: $(date)"
for r in $RUNS; do

  for c in $CONNECTIONS; do
    echo "------------------"
    echo "[DBG] $(date)"
    echo "[DBG] Run #$r: Connections $c."
    echo "[DBG] Cleaning up database"
    /usr/bin/redis-cli -h $HOST -p $PORT FLUSHALL
    sleep 5
    /usr/bin/redis-cli config set dir "/tmp"
    echo "[DBG] Running tests"
    /usr/bin/redis-benchmark -h $HOST -p $PORT -c $c -t ping -d 50 -r 100000 -n 500000
    /usr/bin/redis-benchmark -h $HOST -p $PORT -c $c -t set,get -d 50 -r 100000 -n 500000
    /usr/bin/redis-benchmark -h $HOST -p $PORT -c $c -t lpush,lpop -d 50 -r 100000 -n 500000
    /usr/bin/redis-benchmark -h $HOST -p $PORT -c $c -t sadd -d 50 -r 100000 -n 500000
    echo "------------------"

  done

done

echo "[DBG] End: $(date)"
