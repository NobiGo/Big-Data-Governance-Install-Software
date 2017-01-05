#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;

#脚本生成ssh公私钥文件
/usr/bin/expect << EOF
spawn ssh root@zte-2 "chown -R hdfs:hadoop /var/local/hadoop"
expect {
"*password:" {send "123456\r";exp_continue}
}
spawn ssh root@zte-3 "chown -R hdfs:hadoop /var/local/hadoop"
expect {
"*password:" {send "123456\r";exp_continue}
}
spawn ssh root@zte-2 "chmod -R 775 /var/local/hadoop"
expect {
"*password:" {send "123456\r";exp_continue}
}

spawn ssh root@zte-3 "chmod -R 775 /var/local/hadoop"
expect {
"*password:" {send "123456\r";exp_continue}
}
EOF

if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/granting-authority-othernodes-log
echo "successful!">>/home/hdfs/data-governance/logs/granting-authority-othernodes-log
fi
