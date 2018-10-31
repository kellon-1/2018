#!/bin/bash
mysqldump -h192.168.4.6 -uroot -p123456 --databases bbsdb --table user > /mybakdata/bbsdb_ser$(date +%F).sql


