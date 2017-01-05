#!/bin/sh
MYDATE=$(date +%Y-%m-%d) ;
./unzip-hadoop.sh
./config-core-site.sh
./config-hdfs-site.sh
./config-mapred-site.sh
./config-yarn-site.sh
./config-slaves.sh
./add-javajdk.sh
./granting-authority.sh
./send-hadoop.sh
./granting-authority-othernodes.sh
./configuration-environment-variable.sh
source /etc/profile
ssh hdfs@zte-2 "source /etc/profile"
ssh hdfs@zte-3 "source /etc/profile"
./formatted-file-system.sh
./start-service.sh
if [ $? = 0 ]; then
echo "$MYDATE">>/home/hdfs/data-governance/logs/install-call-log
echo "Environment configuration success!">>/home/hdfs/data-governance/logs/install-call-log
fi
