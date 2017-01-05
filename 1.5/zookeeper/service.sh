#!/bin/bash

zkServer.sh start

/usr/bin/expect << EOF

spawn ssh hdfs@zte-2
send "zkServer.sh start\r" 
expect eof

spawn ssh hdfs@zte-3
send "zkServer.sh start\r"
expect eof   
EOF
