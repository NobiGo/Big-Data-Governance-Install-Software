#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
sudo chown -R hdfs:hadoop /var/local/hadoop
sudo chmod 775 -R /var/local/hadoop/hadoop-2.6.0
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/granting-authority-log
echo "successful!">>/home/hdfs/data-governance/logs/granting-authority-log
fi

