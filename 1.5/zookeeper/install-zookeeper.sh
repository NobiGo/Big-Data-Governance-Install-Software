#!/bin/bash
#解压缩文件
./install-unzip-zookeeper.sh
#传输到其他节点，并且修改zoo.cfg时间
./modify-zoo.cfg-file.sh
#创建myid文件
./create-myid.sh
#配置zookeeper的环境变量
./configuration-environment-variable.sh 

zkServer.sh start

/usr/bin/expect << EOF
spawn ssh hdfs@zte-2
send "zkServer.sh start\r"
expect eof
spawn ssh hdfs@zte-3
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
