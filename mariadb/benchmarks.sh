#!/bin/bash
sleep 10
runId=0
mysqladmin create test
sysbench --db-driver=mysql --mysql-user=root --mysql-db=test --range_size=100 \
  --table_size=10000 --tables=2 --threads=1 --events=0 --time=60 \
  --rand-type=uniform /usr/share/sysbench/oltp_read_only.lua prepare
while [ $runId -lt 10 ]
do
	numCli=10
	while [ $numCli -lt 180 ]
	do
		sysbench --db-driver=mysql --mysql-user=root --mysql-db=test --range_size=100  --table_size=10000 --tables=2  --threads=$numCli --events=0 --time=10  --rand-type=uniform /usr/share/sysbench/oltp_read_only.lua run
		numCli=$(($numCli + 10))
	done 
	runId=$(($runId + 1))
done
