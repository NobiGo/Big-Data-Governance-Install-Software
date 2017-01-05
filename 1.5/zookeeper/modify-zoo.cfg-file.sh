#!/bin/sh
MYDATE=$(date +%Y-%m-%d);
cd /var/local/hadoop/zookeeper-3.4.8/conf
cp zoo_sample.cfg zoo.cfg
sed -i '/dataDir/d' /var/local/hadoop/zookeeper-3.4.8/conf/zoo.cfg
cat >>/var/local/hadoop/zookeeper-3.4.8/conf/zoo.cfg<<EOF
server.1=zte-1:2888:3888
server.2=zte-2:2888:3888
server.3=zte-3:2888:3888
dataDir=/var/local/hadoop/zookeeper-3.4.8/dataDir
dataLogDir=/var/local/hadoop/zookeeper-3.4.8/logs
EOF
if [ $? = 0 ]; then
echo "Failed,please check"
echo "$MYDATE">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file
echo "successful!">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file
else
echo "$MYDATE">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file
echo "Failed,please check">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file
fi

mkdir -p /var/local/hadoop/zookeeper-3.4.8/dataDir
mkdir -p /var/local/hadoop/zookeeper-3.4.8/logs
scp -r /var/local/hadoop/zookeeper-3.4.8 zte-2:/var/local/hadoop
scp -r /var/local/hadoop/zookeeper-3.4.8 zte-3:/var/local/hadoop
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file-log
echo "successful!">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file-log
else
echo "Failed,please check"
echo "$MYDATE">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file-log
echo "Failed,please check">>/home/hdfs/data-governance/logs/modify-zoo.cfg-file-log
fi

