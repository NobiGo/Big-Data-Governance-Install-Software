#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;

/usr/bin/expect << EOF
spawn ssh root@zte-1 "cat >>/etc/profile<<EOF
export HADOOP_HOME=/var/local/hadoop/hadoop-2.6.0
export PATH=$PATH:/var/local/hadoop/hadoop-2.6.0/bin:/var/local/hadoop/hadoop-2.6.0/sbin
EOF"

expect {
"*password:" {send "123456\r";exp_continue}
}

spawn ssh root@zte-2 "cat >>/etc/profile<<EOF
export HADOOP_HOME=/var/local/hadoop/hadoop-2.6.0
export PATH=$PATH:/var/local/hadoop/hadoop-2.6.0/bin:/var/local/hadoop/hadoop-2.6.0/sbin
EOF"

expect {
"*password:" {send "123456\r";exp_continue}
}


spawn ssh root@zte-3 "cat >>/etc/profile<<EOF
export HADOOP_HOME=/var/local/hadoop/hadoop-2.6.0
export PATH=$PATH:/var/local/hadoop/hadoop-2.6.0/bin:/var/local/hadoop/hadoop-2.6.0/sbin
EOF"

expect {
"*password:" {send "123456\r";exp_continue}
}
EOF
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
echo "successful!">>/home/hdfs/data-governance/logs/configuration-environment-variable-log
fi

