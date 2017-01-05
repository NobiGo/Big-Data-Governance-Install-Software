#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
rm -f vim /var/local/hadoop/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
cp /home/hdfs/data-governance/conf/hadoop/hdfs-site.xml /var/local/hadoop/hadoop-2.6.0/etc/hadoop
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/config-hdfs-site-log
echo "successful!">>/home/hdfs/data-governance/logs/config-hdfs-site-log
fi

