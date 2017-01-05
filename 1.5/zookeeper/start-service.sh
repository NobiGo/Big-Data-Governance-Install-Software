#!/bin/sh
MYDATE=$(date +%Y-%m-%d);
./install-unzip-zookeeper.sh
./modify-zoo.cfg-file.sh
./create-myid.sh
./configuration-environment-variable.sh

zkServer.sh start

/usr/bin/expect << EOF
spawn ssh hdfs@zte-2
expect "#*"
send "zkServer.sh start\r" 
expect eof
spawn ssh hdfs@zte-3
expect "#*" 
send "zkServer.sh start\r"
expect eof   
EOF

if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/zookeeper-start-log
echo "successful!">>/home/hdfs/data-governance/logs/zookeeper-start-log
else
echo "Failed,please check"
echo "$MYDATE">>/home/hdfs/data-governance/logs/zookeeper-start-log
echo "Failed,please check">>/home/hdfs/data-governance/logs/zookeeper-start-log
fi
