#!/bin/bash

#yum -y install expect

#实现自动交互ssh登陆
host=192.168.4.10
expect << EOF
spawn ssh $host
#expect "yes/no"		{send "yes\r"}
expect "password"	{send "123456\r"}
expect "#"		{send "touch /a.txt\r"}
expect "#"		{send "exit\r"}
EOF
