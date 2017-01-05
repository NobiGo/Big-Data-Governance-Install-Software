#!/bin/bash
#执行检测并安装expect模块
ep=`rpm -qa | grep expect`
#z代表的是该变量是否有值
if [ -z $ep   ] ; then
 echo "检测到你的系统，没有安装expect模块，准备执行安装"
 yum install -y expect
else
 echo "已经安装expect模块,开始进行ssh配置"
fi
