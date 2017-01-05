#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
rm -f vim /var/local/hadoop/hadoop-2.6.0/etc/hadoop/core-site.xml
cp /home/hdfs/data-governance/conf/hadoop/core-site.xml /var/local/hadoop/hadoop-2.6.0/etc/hadoop
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/config-core-site-log
echo "successful!">>/home/hdfs/data-governance/logs/config-core-site-log
fi
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/config-core-site-log
echo "successful!">>/home/hdfs/data-governance/logs/config-core-site-log
fi
