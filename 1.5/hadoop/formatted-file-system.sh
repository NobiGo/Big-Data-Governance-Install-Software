#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
hdfs namenode -format
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/formatted-file-system-log
echo "successful!">>/home/hdfs/data-governance/logs/formatted-file-system-log
fi
