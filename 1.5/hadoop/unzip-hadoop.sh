#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
sudo mkdir /var/local/hadoop
cd /var/local/hadoop
sudo cp /home/hdfs/hadoop-2.6.0.tar.gz /var/local/hadoop/
echo "解压Hadoop-2.6.0目录"
sudo tar zxf hadoop-2.6.0.tar.gz
echo  "改变Hadoop-2.6.0目录权限"
sudo chown -R hdfs:hadoop /var/local/hadoop
sudo chmod -R 775 /var/local/hadoop
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/unzip-hadoop-log
echo "successful!">>/home/hdfs/data-governance/logs/unzip-hadoop-log
fi
