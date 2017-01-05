#!/bin/sh
#History:
#2016/08/31 ForTheDream FTD
MYDATE=$(date +%Y-%m-%d) ;
file=/home/hdfs/data-governance/dependencies/zookeeper-3.4.8.tar.gz
if [ ! -f $file ]; then
cd
#echo -e "zookeeper-3.4.5.tar.gz is not exist,please download by input URL\nyour download URL is:"
#read url
#wget $url
echo "开始下载Zookeeper镜像"
wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
echo "解压缩Zookeeper安装文件"
tar zxf zookeeper-3.4.8.tar.gz
mv /home/hdfs/zookeeper-3.4.8 /var/local/hadoop
   if [ $? = 0 ]; then
   echo "$MYDATE">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log
   echo "successful!">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log
   else
   echo "$MYDATE">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log
   echo "Download Failed,please check the url">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log
   fi
else
cd /home/hdfs/data-governance/dependencies
tar zxf zookeeper-3.4.8.tar.gz
mv zookeeper-3.4.8 /var/local/hadoop
fi
echo "$MYDATE">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log
echo "successful!">>/home/hdfs/data-governance/logs/install-unzip-zookeeper-log

