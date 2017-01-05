#!/bin/sh
MYDATE=$(date +%Y-%m-%d);
cd /var/local/hadoop/zookeeper-3.4.8/dataDir
touch myid
cat >>/var/local/hadoop/zookeeper-3.4.8/dataDir/myid<<EOF
1
EOF
ssh hdfs@zte-2 "cd /var/local/hadoop/zookeeper-3.4.8/dataDir
touch myid
cat >>/var/local/hadoop/zookeeper-3.4.8/dataDir/myid<<EOF
2
EOF"

ssh hdfs@zte-3 "cd /var/local/hadoop/zookeeper-3.4.8/dataDir
touch myid
cat >>/var/local/hadoop/zookeeper-3.4.8/dataDir/myid<<EOF
3
EOF"
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/create-myid-log
echo "successful!">>/home/hdfs/data-governance/logs/create-myid-log
else
echo "Failed,please check"
echo "$MYDATE">>/home/hdfs/data-governance/logs/create-myid-log
echo "Failed,please check">>/home/hdfs/data-governance/logs/create-myid-log
fi
