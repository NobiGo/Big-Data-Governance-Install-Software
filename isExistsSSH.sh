#!/bin/bash

#判断.ssh文件是否已经存在

#判断是否为root用户来决定.ssh文件生成目录

username=$1

if [ "root"="$username"  ];then
        ssh_path=/root/.ssh
else
        ssh_path=/home/$username/.ssh
fi

#判断.ssh目录是否存在,如果存在目录，则删除重新建立
if [ -d  $ssh_path ]
then
echo ".ssh already exists"
echo ".ssh is removing"
rm  -rf  $ssh_path
fi
#----------------------------------------需要确定进入哪个目录（后序）
echo "enter root"
cd /root/

