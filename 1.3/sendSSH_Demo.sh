#!/bin/bash
HostFile=/root/hosts
cat $HostFile | while read line
do
ip=`echo "$line" | awk '{print $1}'` #输出每行ip字段
username=`echo "$line" | awk '{print $2}'` #输出每行usename字段
passwd=`echo "$line" | awk '{print $3}'` #输出每行passwd字段
hostname=`echo "$line" | awk '{print $4}'`

#脚本生成ssh公私钥文件
/usr/bin/expect << EOF
spawn   ssh-copy-id $username@$hostname
expect {
"*yes/no*" {send "yes\r" ;exp_continue}
"*password:" {send "123456\r"}
}
expect eof
EOF
done
