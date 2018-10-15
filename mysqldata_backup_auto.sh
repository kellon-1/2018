#!/bin/bash

day=$(date +%F)

########### mysqldump #################
#if [ ! -e /kellon ];then
#	mkdir /kellon
#fi
##Auto backup all data of mysql
#mysqldump -uroot -paaa123 -A > /kellon/${day}mysql.back 

# set cront and set quiet print
# /etc/crontab 0 3 * * 1 /root/BackupAuto.sh &> /dev/null 
############ xtarbackup ################

#Auto backup all mysql
#innobackupex --user root --password 123456 /kellon/mysql_back$day --no-timestamp
#Auto backup designated databases
#innobackupex --user root --password 123456 --databases="kellon mysql performance_schema sys" /kellon/db_kellon_back$day --no-timestamp

############# xtarbackup ###############

i=1
while [ -e /kellon/mysql_new${i}dir ]
do
	let i++
done

innobackupex --user root --password 123456 \
	--databases="kellon sys mysql performance_schema" \
	--incremental /kellon/mysql_new${i}dir \
	--incremental-basedir=/kellon/mysql_new$[$i-1]dir --no-timestamp	








