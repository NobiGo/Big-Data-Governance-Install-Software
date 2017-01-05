#!/bin/sh
MYDATE=$(date +%Y-%m-%d);

#脚本生成ssh公私钥文件
/usr/bin/expect << EOF

spawn ssh root@zte-1 "cat >>/etc/profile<<EOF
export ZOOKEEPER_HOME=/var/local/hadoop/zookeeper-3.4.8
export PATH=$PATH:/var/local/hadoop/zookeeper-3.4.8/bin
EOF"
expect {
"*password:" {send "123456\r";exp_continue}
}

spawn ssh root@zte-2 "cat >>/etc/profile<<EOF
export ZOOKEEPER_HOME=/var/local/hadoop/zookeeper-3.4.8
export PATH=$PATH:/var/local/hadoop/zookeeper-3.4.8/bin
EOF"
expect {
"*password:" {send "123456\r";exp_continue}
}


spawn ssh root@zte-3 "cat >>/etc/profile<<EOF
export ZOOKEEPER_HOME=/var/local/hadoop/zookeeper-3.4.8
export PATH=$PATH:/var/local/hadoop/zookeeper-3.4.8/bin
EOF"
expect {
"*password:" {send "123456\r";exp_continue}
}

EOF

if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
echo "successful!">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
else
echo "Failed,please check"
echo "$MYDATE">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
echo "Failed,please check">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
fi
