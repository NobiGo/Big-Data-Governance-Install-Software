#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
cd /var/local/hadoop/hadoop-2.6.0/sbin
./start-dfs.sh
./start-yarn.sh
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/start-service-log
echo "successful!">>/home/hdfs/data-governance/logs/start-service-log
fi
