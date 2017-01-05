#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
sudo chmod -R a+w /var/local/hadoop/hadoop-2.6.0/etc/hadoop/hadoop-env.sh
sed -i '/export JAVA_HOME/d' /var/local/hadoop/hadoop-2.6.0/etc/hadoop/hadoop-env.sh
cat >>/var/local/hadoop/hadoop-2.6.0/etc/hadoop/hadoop-env.sh<<EOF
export JAVA_HOME=/var/local/jdk1.7.0_79
EOF
sudo chmod -R a+w /var/local/hadoop/hadoop-2.6.0/etc/hadoop/yarn-env.sh
cat >>/var/local/hadoop/hadoop-2.6.0/etc/hadoop/yarn-env.sh<<EOF
export JAVA_HOME=/var/local/jdk1.7.0_79
EOF
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/add-javajdk-log
echo "successful!">>/home/hdfs/data-governance/logs/add-javajdk-log
fi
