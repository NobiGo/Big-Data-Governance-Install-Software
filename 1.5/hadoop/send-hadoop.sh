#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
sudo scp -r /var/local/hadoop/hadoop-2.6.0  zte-2:/var/local/hadoop/
sudo scp -r /var/local/hadoop/hadoop-2.6.0  zte-3:/var/local/hadoop/
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/send-hadoop-log
echo "successful!">>/home/hdfs/data-governance/logs/send-hadoop-log
fi

